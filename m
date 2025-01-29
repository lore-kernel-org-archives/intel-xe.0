Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAAEC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 16:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ECA10E121;
	Wed, 29 Jan 2025 16:38:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B1410E121;
 Wed, 29 Jan 2025 16:38:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3445862233160362081=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe3=3A_Extend_wa=5F?=
 =?utf-8?q?15015404425_for_xe3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 16:38:10 -0000
Message-ID: <173816869080.2494598.18276546382169533683@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250129005551.106214-1-matthew.s.atwood@intel.com>
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

--===============3445862233160362081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Extend wa_15015404425 for xe3
URL   : https://patchwork.freedesktop.org/series/144078/
State : failure

== Summary ==

CI Bug Log - changes from xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79_full -> xe-pw-144078v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144078v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144078v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144078v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-3/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-9/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  
Known issues
------------

  Here are the changes found in xe-pw-144078v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2423])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@core_getclient.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@core_getclient.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#3453])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@core_setmaster@master-drop-set-shared-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3249])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@fbdev@write.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1125])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1033])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#3908]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2136]) +30 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +76 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +27 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#314]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2423] / [i915#2575]) +37 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#1033]) +14 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#702])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#3321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2423]) +110 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#2882])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#2423] / [i915#2575]) +43 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][45] ([Intel XE#1504]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#2136]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1401] / [Intel XE#1745])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1401])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#651])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#656]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2136]) +36 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2136] / [Intel XE#2351]) +18 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#653]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2763]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2763]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +19 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2446]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_pm_rpm@basic-rte.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@cursor:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#3868])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@kms_pm_rpm@cursor.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#2446]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1127])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#362])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@xe_create@create-execqueues-noleak-shared:
    - shard-dg2-set2:     [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1033]) +1 other test dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_create@create-execqueues-noleak-shared.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_create@create-execqueues-noleak-shared.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2905])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2905]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-bmg:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#4172])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@xe_exec_balancer@many-cm-virtual-userptr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-7/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1392]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#1130]) +90 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1130]) +69 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-271x271:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][85] ([Intel XE#4172]) +12 other tests dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-271x271.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#1130]) +266 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#4173]) +2 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#2229]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1192]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#378])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#3546]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@xe_module_load@many-reload.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][97] -> [FAIL][98] ([Intel XE#3546])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1948])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][100] -> [DMESG-WARN][101] ([Intel XE#2953]) +1 other test dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][102] -> [ABORT][103] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [PASS][104] -> [ABORT][105] ([Intel XE#4046])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_pm_residency@cpg-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#944])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][107] ([Intel XE#3249]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@core_getversion@all-cards.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][109] ([Intel XE#3440]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@core_getversion@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [DMESG-WARN][111] ([Intel XE#4173]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@core_hotunplug@hotrebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-6/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#2134]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@fbdev@eof.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][115] ([Intel XE#2134]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@fbdev@nullptr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@fbdev@nullptr.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][117] ([Intel XE#1033]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][119] ([Intel XE#2136]) -> [PASS][120] +23 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][121] ([Intel XE#1033]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#2423] / [i915#2575]) -> [PASS][124] +57 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][125] ([Intel XE#2291]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#2423]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_dp_aux_dev.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][129] ([Intel XE#2316]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][131] ([Intel XE#3321]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][133] ([Intel XE#3098]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][135] ([Intel XE#2423]) -> [PASS][136] +87 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][137] ([Intel XE#886]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#301]) -> [PASS][140] +4 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-panning@a-dp2:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#4172]) -> [PASS][142] +11 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@kms_flip@flip-vs-panning@a-dp2.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-7/igt@kms_flip@flip-vs-panning@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-WARN][143] -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][146] +10 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2136]) -> [PASS][148] +15 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1033]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2446]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][153] ([Intel XE#2446]) -> [PASS][154] +2 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1130]) -> [PASS][156] +105 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_drm_fdinfo@utilization-others-idle.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1392]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][159] ([Intel XE#1130]) -> [PASS][160] +209 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [SKIP][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186]) ([Intel XE#378]) -> ([PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][209] ([Intel XE#3546]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#1616] / [Intel XE#4172]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][213] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-2/igt@xe_pm@s4-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][215] ([Intel XE#2233]) -> [SKIP][216] ([Intel XE#2423])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2423] / [i915#2575]) -> [SKIP][218] ([Intel XE#3768])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [DMESG-WARN][219] ([Intel XE#1033]) -> [SKIP][220] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][221] ([Intel XE#2370]) -> [SKIP][222] ([Intel XE#2423])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][223] ([Intel XE#2136]) -> [SKIP][224] ([Intel XE#2327]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1033]) -> [SKIP][226] ([Intel XE#2136]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2136]) -> [SKIP][228] ([Intel XE#316])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][229] ([Intel XE#2136]) -> [DMESG-WARN][230] ([Intel XE#4172])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][231] ([Intel XE#2327]) -> [SKIP][232] ([Intel XE#2136]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#316]) -> [SKIP][234] ([Intel XE#2136]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [SKIP][236] ([Intel XE#1124]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][238] ([Intel XE#1124]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][239] ([Intel XE#1124]) -> [SKIP][240] ([Intel XE#2136]) +12 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][241] ([Intel XE#2328]) -> [SKIP][242] ([Intel XE#2136])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][243] ([Intel XE#2136]) -> [SKIP][244] ([Intel XE#607])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136]) -> [SKIP][246] ([Intel XE#610]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][247] ([Intel XE#2136]) -> [SKIP][248] ([Intel XE#1124]) +12 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1124]) -> [SKIP][250] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][252] ([Intel XE#619])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124]) -> [SKIP][254] ([Intel XE#2136]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][255] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][256] ([Intel XE#2423])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2191]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][259] ([Intel XE#2423]) -> [SKIP][260] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][261] ([Intel XE#2423]) -> [SKIP][262] ([Intel XE#367]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#367]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#367]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][267] ([Intel XE#367]) -> [SKIP][268] ([Intel XE#2423]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2136]) -> [SKIP][270] ([Intel XE#2887]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2907]) -> [SKIP][272] ([Intel XE#2136]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][273] ([Intel XE#2887]) -> [SKIP][274] ([Intel XE#2136]) +21 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#2907])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][277] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][278] ([Intel XE#2136])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][280] ([Intel XE#2136]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#3442])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][283] ([Intel XE#3432]) -> [SKIP][284] ([Intel XE#2136]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#3432]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][288] ([Intel XE#1033])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][294] ([Intel XE#455] / [Intel XE#787])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][296] ([Intel XE#2136] / [Intel XE#2351])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#2724])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][299] ([Intel XE#2423]) -> [SKIP][300] ([Intel XE#2325]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2423] / [i915#2575]) -> [SKIP][302] ([Intel XE#306])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#306]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][305] ([Intel XE#2325]) -> [SKIP][306] ([Intel XE#2423]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][307] ([Intel XE#2252]) -> [SKIP][308] ([Intel XE#2423]) +14 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [SKIP][310] ([Intel XE#373]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][311] ([Intel XE#2423]) -> [SKIP][312] ([Intel XE#2252]) +10 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#373]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][315] ([Intel XE#2423]) -> [DMESG-WARN][316] ([Intel XE#4172]) +5 other tests dmesg-warn
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_color@ctm-blue-to-red.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [FAIL][318] ([Intel XE#1178])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_content_protection@atomic.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][319] ([Intel XE#2390]) -> [SKIP][320] ([Intel XE#2423])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#307])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][323] ([Intel XE#2341]) -> [SKIP][324] ([Intel XE#2423]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][325] ([Intel XE#2423]) -> [SKIP][326] ([Intel XE#2341])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_content_protection@type1.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [SKIP][328] ([Intel XE#2320]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#308]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][331] ([Intel XE#2321]) -> [SKIP][332] ([Intel XE#2423]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][333] ([Intel XE#2320]) -> [SKIP][334] ([Intel XE#2423]) +9 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#308]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][337] ([Intel XE#2423]) -> [SKIP][338] ([Intel XE#2321]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][339] ([Intel XE#2286]) -> [SKIP][340] ([Intel XE#2423]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][341] ([Intel XE#2423]) -> [SKIP][342] ([Intel XE#2291]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][343] ([Intel XE#2291]) -> [SKIP][344] ([Intel XE#2423])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][345] ([Intel XE#2423]) -> [DMESG-WARN][346] ([Intel XE#877])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][347] ([Intel XE#4172] / [Intel XE#877]) -> [DMESG-WARN][348] ([Intel XE#4172])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2425])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][351] ([Intel XE#3070]) -> [SKIP][352] ([Intel XE#2136])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][353] ([Intel XE#2136]) -> [SKIP][354] ([Intel XE#2244]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_dsc@dsc-basic.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][355] ([Intel XE#2244]) -> [SKIP][356] ([Intel XE#2136])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][358] ([Intel XE#455])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][359] ([Intel XE#776]) -> [SKIP][360] ([Intel XE#2136])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_fbcon_fbt@psr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][361] ([Intel XE#2136]) -> [SKIP][362] ([Intel XE#776])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][363] ([Intel XE#2423]) -> [SKIP][364] ([Intel XE#2373])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][365] ([Intel XE#2375]) -> [SKIP][366] ([Intel XE#2423])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1135]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_feature_discovery@psr1.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][369] ([Intel XE#2423]) -> [SKIP][370] ([Intel XE#2374])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][371] ([Intel XE#2423]) -> [SKIP][372] ([Intel XE#2316]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][373] ([Intel XE#2316]) -> [SKIP][374] ([Intel XE#2423]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#301]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][377] ([Intel XE#2625]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [DMESG-FAIL][380] ([Intel XE#4172])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][382] ([Intel XE#1033]) +6 other tests dmesg-warn
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][383] ([Intel XE#3321]) -> [SKIP][384] ([Intel XE#2423])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][385] ([Intel XE#2955]) -> [INCOMPLETE][386] ([Intel XE#2049] / [Intel XE#2597])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][387] ([Intel XE#4172]) -> [INCOMPLETE][388] ([Intel XE#2049] / [Intel XE#2597])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [DMESG-WARN][389] ([Intel XE#1033]) -> [SKIP][390] ([Intel XE#2136] / [Intel XE#2351])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][391] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][392] ([Intel XE#2136]) +8 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#455]) -> [SKIP][394] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][395] ([Intel XE#2136]) -> [SKIP][396] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136]) -> [SKIP][398] ([Intel XE#455])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][399] ([Intel XE#2136]) -> [SKIP][400] ([Intel XE#2311]) +27 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#651]) +15 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#2312]) +15 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][405] ([Intel XE#2311]) -> [SKIP][406] ([Intel XE#2136]) +38 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][407] ([Intel XE#2312]) -> [SKIP][408] ([Intel XE#2311]) +4 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#651]) -> [SKIP][410] ([Intel XE#2136]) +14 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#651]) -> [SKIP][412] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][413] ([Intel XE#4141]) -> [SKIP][414] ([Intel XE#2136]) +19 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [DMESG-WARN][416] ([Intel XE#1033])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#4141]) +14 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][419] ([Intel XE#2312]) -> [SKIP][420] ([Intel XE#4141])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][422] ([Intel XE#651]) +5 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#658]) -> [SKIP][424] ([Intel XE#2136] / [Intel XE#2351])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#2352])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#653]) -> [SKIP][428] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][429] ([Intel XE#2313]) -> [SKIP][430] ([Intel XE#2136]) +31 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][432] ([Intel XE#653])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][433] ([Intel XE#2136]) -> [SKIP][434] ([Intel XE#2313]) +30 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][435] ([Intel XE#2352]) -> [SKIP][436] ([Intel XE#2136])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][437] ([Intel XE#2350]) -> [SKIP][438] ([Intel XE#2136])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][439] ([Intel XE#2312]) -> [SKIP][440] ([Intel XE#2136]) +18 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#653]) +19 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][443] ([Intel XE#2312]) -> [SKIP][444] ([Intel XE#2313]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#653]) -> [SKIP][446] ([Intel XE#2136]) +13 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][447] ([Intel XE#2423]) -> [SKIP][448] ([Intel XE#2502])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][449] ([Intel XE#2423]) -> [SKIP][450] ([Intel XE#3544])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2423] / [i915#2575]) -> [SKIP][452] ([Intel XE#455]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][453] ([Intel XE#346]) -> [SKIP][454] ([Intel XE#2136])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][455] ([Intel XE#3012]) -> [SKIP][456] ([Intel XE#2136])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][457] ([Intel XE#2136]) -> [SKIP][458] ([Intel XE#2934])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][459] ([Intel XE#2927]) -> [SKIP][460] ([Intel XE#2136])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#4090])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2925]) -> [SKIP][464] ([Intel XE#2136])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][465] ([Intel XE#2501]) -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][467] ([Intel XE#2486]) -> [SKIP][468] ([Intel XE#2423])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_panel_fitting@legacy.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][469] ([Intel XE#2393]) -> [SKIP][470] ([Intel XE#2423])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][471] ([Intel XE#2423]) -> [SKIP][472] ([Intel XE#2493])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2423] / [i915#2575]) -> [SKIP][474] ([Intel XE#2763] / [Intel XE#455])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][475] ([Intel XE#2763]) -> [SKIP][476] ([Intel XE#2423]) +3 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][478] ([Intel XE#1033] / [Intel XE#2566])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][479] ([Intel XE#2423]) -> [SKIP][480] ([Intel XE#2763]) +4 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][481] ([Intel XE#870]) -> [SKIP][482] ([Intel XE#2136]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][483] ([Intel XE#2136]) -> [SKIP][484] ([Intel XE#2938])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#2938]) -> [SKIP][486] ([Intel XE#2136])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2136]) -> [SKIP][488] ([Intel XE#870])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1122]) -> [SKIP][490] ([Intel XE#2136] / [Intel XE#2351])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#3309])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][494] ([Intel XE#908])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][496] ([Intel XE#1129])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][497] ([Intel XE#2499]) -> [SKIP][498] ([Intel XE#2136])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][499] ([Intel XE#2446]) -> [DMESG-WARN][500] ([Intel XE#4172]) +1 other test dmesg-warn
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_rpm@cursor.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][501] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][502] ([Intel XE#2446])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][503] ([Intel XE#2446]) -> [SKIP][504] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1489]) -> [SKIP][506] ([Intel XE#2136]) +5 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][507] ([Intel XE#2136]) -> [SKIP][508] ([Intel XE#1489]) +6 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2136]) -> [SKIP][510] ([Intel XE#1489]) +4 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][511] ([Intel XE#1489]) -> [SKIP][512] ([Intel XE#2136]) +13 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][513] ([Intel XE#2136]) -> [SKIP][514] ([Intel XE#2387]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1122]) -> [SKIP][516] ([Intel XE#2136])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][518] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][519] ([Intel XE#2136]) -> [SKIP][520] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#2136]) -> [SKIP][522] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][524] ([Intel XE#2136]) +4 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][526] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_psr@pr-dpms.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][527] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][528] ([Intel XE#2136]) +21 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][529] ([Intel XE#2234]) -> [SKIP][530] ([Intel XE#2136])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#2939]) -> [SKIP][532] ([Intel XE#2136] / [Intel XE#2351])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][533] ([Intel XE#2423]) -> [SKIP][534] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#2423] / [i915#2575]) -> [SKIP][536] ([Intel XE#3414]) +1 other test skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][537] ([Intel XE#2330]) -> [SKIP][538] ([Intel XE#2423]) +1 other test skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#3414]) -> [SKIP][540] ([Intel XE#2423] / [i915#2575])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][541] ([Intel XE#2423]) -> [SKIP][542] ([Intel XE#2413])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][543] ([Intel XE#2413]) -> [SKIP][544] ([Intel XE#2423])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][545] ([Intel XE#1435]) -> [SKIP][546] ([Intel XE#2423])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][547] ([Intel XE#2426]) -> [SKIP][548] ([Intel XE#2423])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][549] ([Intel XE#2426]) -> [SKIP][550] ([Intel XE#2509])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#2423] / [i915#2575]) -> [SKIP][552] ([Intel XE#330])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#2423] / [i915#2575]) -> [SKIP][554] ([Intel XE#2168])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_vrr@cmrr.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#455]) -> [SKIP][556] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_vrr@flip-basic-fastset.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][557] ([Intel XE#2423]) -> [SKIP][558] ([Intel XE#2168])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_vrr@lobf.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#2168]) -> [SKIP][560] ([Intel XE#2423] / [i915#2575])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_vrr@lobf.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][561] ([Intel XE#1499]) -> [SKIP][562] ([Intel XE#2423]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_vrr@max-min.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][563] ([Intel XE#2423]) -> [SKIP][564] ([Intel XE#1499])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_vrr@negative-basic.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#756]) -> [SKIP][566] ([Intel XE#2423] / [i915#2575])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_writeback@writeback-check-output.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#2423] / [i915#2575]) -> [SKIP][568] ([Intel XE#756])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][569] ([Intel XE#756]) -> [SKIP][570] ([Intel XE#2423])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][571] ([Intel XE#2423]) -> [SKIP][572] ([Intel XE#756]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][574] ([Intel XE#2423] / [i915#2575])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][575] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][576] ([Intel XE#2423])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1130]) -> [SKIP][578] ([Intel XE#1123])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][579] ([Intel XE#1130]) -> [SKIP][580] ([Intel XE#2504])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@virtual-utilization-single-idle:
    - shard-bmg:          [SKIP][581] ([Intel XE#1130]) -> [DMESG-WARN][582] ([Intel XE#4172]) +2 other tests dmesg-warn
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2905]) -> [SKIP][584] ([Intel XE#1130]) +5 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_eudebug@basic-exec-queues.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][585] ([Intel XE#1130]) -> [SKIP][586] ([Intel XE#2905]) +12 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-bmg:          [SKIP][587] ([Intel XE#3889]) -> [SKIP][588] ([Intel XE#1130])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          [SKIP][589] ([Intel XE#1130]) -> [SKIP][590] ([Intel XE#3889])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          [SKIP][591] ([Intel XE#2905]) -> [SKIP][592] ([Intel XE#1130]) +12 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][593] ([Intel XE#1130]) -> [SKIP][594] ([Intel XE#2322]) +10 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][595] ([Intel XE#2322]) -> [SKIP][596] ([Intel XE#1130]) +11 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1130]) -> [SKIP][598] ([Intel XE#288]) +17 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#288]) -> [SKIP][600] ([Intel XE#1130]) +16 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1130]) -> [SKIP][602] ([Intel XE#2360])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#2360]) -> [SKIP][604] ([Intel XE#1130])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1130]) -> [DMESG-WARN][606] ([Intel XE#1033]) +2 other tests dmesg-warn
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#1130]) -> [SKIP][608] ([Intel XE#2905]) +10 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [DMESG-WARN][609] ([Intel XE#1033]) -> [SKIP][610] ([Intel XE#1130]) +4 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#255])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][613] ([Intel XE#1130]) -> [SKIP][614] ([Intel XE#586])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_mmap@small-bar.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][616] ([Intel XE#1130]) +4 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1130]) -> [SKIP][618] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_oa@non-system-wide-paranoid.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][619] ([Intel XE#1130]) -> [SKIP][620] ([Intel XE#2248])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_oa@unprivileged-single-ctx-counters.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][621] ([Intel XE#1130]) -> [SKIP][622] ([Intel XE#1420])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][623] ([Intel XE#2245]) -> [SKIP][624] ([Intel XE#1130])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_pat@pat-index-xelp.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1130]) -> [SKIP][626] ([Intel XE#2284] / [Intel XE#366])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1130]) -> [SKIP][628] ([Intel XE#2284])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][629] ([Intel XE#2284]) -> [SKIP][630] ([Intel XE#1130])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#2284]) +1 other test skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [SKIP][633] ([Intel XE#1130]) -> [DMESG-WARN][634] ([Intel XE#1616] / [Intel XE#4172])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pm@s2idle-multiple-execs.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][636] ([Intel XE#1130])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [ABORT][637] ([Intel XE#1033] / [Intel XE#1358] / [Intel XE#1794]) -> [DMESG-WARN][638] ([Intel XE#1033] / [Intel XE#569])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_pm@s3-mocs.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1130]) -> [DMESG-WARN][640] ([Intel XE#1033] / [Intel XE#569])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][641] ([Intel XE#579]) -> [SKIP][642] ([Intel XE#1130])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][643] ([Intel XE#944]) -> [SKIP][644] ([Intel XE#1130]) +3 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][645] ([Intel XE#1130]) -> [SKIP][646] ([Intel XE#944]) +2 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#944]) -> [SKIP][648] ([Intel XE#1130]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#1130]) -> [SKIP][650] ([Intel XE#944]) +1 other test skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#1130]) -> [SKIP][652] ([Intel XE#4130])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][653] ([Intel XE#1130]) -> [SKIP][654] ([Intel XE#4130])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1130]) -> [SKIP][656] ([Intel XE#3342])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][657] ([Intel XE#1130]) -> [SKIP][658] ([Intel XE#3342])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][659] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][660] ([Intel XE#1130])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
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
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
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
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -> xe-pw-144078v1

  IGT_8212: 76102a17560c6e6fc6528db29286b0266ccc48ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79
  xe-pw-144078v1: 144078v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/index.html

--===============3445862233160362081==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Extend wa_15015404425 for xe3</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144078/">https://patchwork.freedesktop.org/series/144078/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144078v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144078v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef=
1ffcd79_full -&gt; xe-pw-144078v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144078v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144078v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1440=
78v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-9/igt@kms_frontbuffer_trac=
king@basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-4/igt@kms_psr@=
fbc-psr2-primary-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-8/igt@kms_psr@fbc-psr2-prim=
ary-render.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144078v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@core_g=
etclient.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144078v1/shard-dg2-433/igt@core_getclient.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@fbdev@wr=
ite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144078v1/shard-bmg-3/igt@fbdev@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp=
-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-2/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_big_=
fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@linear-=
16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-wit=
hout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_content_protection@atom=
ic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x12=
8-right-edge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +37 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor=
-vs-flip-legacy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +14 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-che=
ck@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_fl=
ip@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_flip@blocking-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@kms_flip@flip-vs-s=
uspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +36 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_pm_r=
pm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">I=
ntel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@kms_pm_=
rpm@cursor.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144078v1/shard-adlp-3/igt@kms_pm_rpm@cursor.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868"=
>Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_pm=
_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak-shared:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_cre=
ate@create-execqueues-noleak-shared.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_crea=
te@create-execqueues-noleak-shared.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/igt@xe_eudebug_online@debugger-=
reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@xe_exec_=
balancer@many-cm-virtual-userptr.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-7/igt@xe_exec_bala=
ncer@many-cm-virtual-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exe=
c_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_ba=
sic@no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +90 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-system-271x271=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_exercise_blt@fast-copy-inc=
-dimension@tile64-vram01-system-271x271.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) =
+12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +266 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-a=
dlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@xe_live_=
ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_liv=
e_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144078v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3546">Intel XE#3546</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@r=
eload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-8/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-5/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_pm_=
residency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_pm_residency@cpg-bas=
ic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4046">Intel XE#4046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@core_get=
version@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@core_getversi=
on@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@core_ho=
tunplug@hotrebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-adlp-6/igt@core_h=
otunplug@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@fbdev@=
eof.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@fbdev@eof.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@fbdev@nullptr.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-4/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144078v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-d=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bm=
g-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> +23 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144078v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +57 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_dp_aux_dev.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_flip@2x-fl=
ip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard=
-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-=
1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +87 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-1/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-7/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-7/igt@kms_flip=
@flip-vs-panning@a-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-7/igt@km=
s_flip@flip-vs-panning@a-dp2.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-WARN</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v=
1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-down=
scaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-onoff.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-o=
noff.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Int=
el XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-s=
pr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm=
_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@=
kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_drm=
_fdinfo@utilization-others-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/=
igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> +105 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-436/=
igt@xe_exec_basic@multigpu-no-exec-rebind.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_exec_=
fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PA=
SS</a> +209 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1=
ffcd79/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9d=
d59ef1ffcd79/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7c=
c609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fc=
c43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f28=
05b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486=
bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
68-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ff=
cd79/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd5=
9ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43e7cc60=
9b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b5fcc43=
e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0f2805b=
5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-486bb0=
f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2568-=
486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144078v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4078v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144078v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44078v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144078v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_modul=
e_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-bmg-7/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-lnl-5/igt@xe_pm@s4-=
basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-=
3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">=
Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144078v1/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-no=
nblocking-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370=
">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-4=
33/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@=
kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-1=
80-hflip-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@km=
s_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@=
kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg=
-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4078v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/=
igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
3 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-43=
3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_bw=
@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_bw@l=
inear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bm=
g-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2=
887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_ccs@=
crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@k=
ms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shar=
d-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
078v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144078v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-r=
c-ccs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-d=
g2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
078v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-=
dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_chamel=
ium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ch=
amelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ch=
amelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-466/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-=
433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_colo=
r@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_color@ctm=
-blue-to-red.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +5 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_curs=
or_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@k=
ms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1=
/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@km=
s_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt=
@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#228=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
078v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel =
XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144078v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_dsc@=
dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_dsc@dsc-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-=
466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_fbcon_fbt@psr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_fbcon_fbt=
@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/s=
hard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-=
dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-=
433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_fli=
p@2x-plain-flip-ts-check.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fl=
ip@flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-dg2-466/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interrup=
tible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_fli=
p@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-=
4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"=
>Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/=
shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144078v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-=
64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144078v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
078v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-in=
dfb-draw-render.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144078v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
1">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-s=
cndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1440=
78v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44078v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_getf=
b@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_getfb@ge=
tfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_joiner@ba=
sic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_j=
oiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg=
-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#293=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard=
-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bm=
g-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_plan=
e_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144078v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-=
upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44078v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-75.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144078v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_=
backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_=
pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@km=
s_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_r=
pm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@kms_pm_rpm@cursor.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_pm_rpm@mode=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
078v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-ex=
ceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1=
/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard=
-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_=
psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_ps=
r@fbc-pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-43=
3/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_=
psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt=
@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard=
-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_p=
sr@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3=
/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/s=
hard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_r=
otation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_ro=
tation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/s=
hard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bm=
g-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-=
dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@kms_scal=
ing_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms=
_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg=
2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@kms_vr=
r@flip-basic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_vrr@fl=
ip-basic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@kms_vrr@lobf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@kms_vrr@negative=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@kms_wr=
iteback@writeback-check-output.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@=
kms_writeback@writeback-check-output.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@kms_writ=
eback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@kms_writ=
eback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@k=
ms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/sh=
ard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-1/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE=
#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144078v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@virtual-utilization-single-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_drm_f=
dinfo@virtual-utilization-single-idle.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg=
-6/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel =
XE#4172</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_eud=
ebug@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/igt@xe_eud=
ebug@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_eude=
bug@basic-vm-bind-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_eudeb=
ug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/i=
gt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg=
-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#388=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_eudeb=
ug_online@interrupt-other.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_eu=
debug_online@interrupt-other.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144078v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/s=
hard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
60">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg=
2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exe=
c_queue_property@timeslice_duration_us-property-min-max.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#=
1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144078v1/shard-dg2-466/igt@xe_exec_queue_property@timeslice_duration_us-pro=
perty-min-max.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463=
/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +=
10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-4=
33/igt@xe_exec_threads@threads-hang-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_huc_copy@hu=
c_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shar=
d-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_oa@=
non-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_o=
a@non-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_oa@un=
privileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/ig=
t@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-6/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-8/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_pm@s2=
idle-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-4/igt@xe_pm@s2idl=
e-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-466/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433/=
igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-432/igt@xe_pm@=
s3-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-=
436/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_pm@=
s3-vm-bind-unbind-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-466/igt@xe_pm@s=
3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-8/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_pm@vram-d3=
cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-4/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-3/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_que=
ry@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-463/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-433=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@x=
e_query@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-463/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44078v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-433/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2-463/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-bmg-3/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-bmg-6/igt@xe_sriov_flr=
@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79/shard-dg2-436/igt@xe_wed=
ged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144078v1/shard-dg2=
-433/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -&gt; xe-pw-144=
078v1</li>
</ul>
<p>IGT_8212: 76102a17560c6e6fc6528db29286b0266ccc48ef @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc6=
09b9dd59ef1ffcd79<br />
  xe-pw-144078v1: 144078v1</p>

</body>
</html>

--===============3445862233160362081==--
