Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF24C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F110E2B6;
	Tue,  1 Jul 2025 12:51:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC510E288;
 Tue,  1 Jul 2025 12:51:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2662372277733099140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Fxi_typo_in_Kcon?=
 =?utf-8?q?fig?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 12:51:10 -0000
Message-ID: <175137427061.123904.11989391726103174128@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250627074119.347826-1-dev@lankhorst.se>
In-Reply-To: <20250627074119.347826-1-dev@lankhorst.se>
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

--===============2662372277733099140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fxi typo in Kconfig
URL   : https://patchwork.freedesktop.org/series/150856/
State : failure

== Summary ==

CI Bug Log - changes from xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8_FULL -> xe-pw-150856v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150856v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150856v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150856v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  
Known issues
------------

  Here are the changes found in xe-pw-150856v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4543]) +15 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][7] ([Intel XE#4543]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][8] ([Intel XE#3884]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#3908]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +153 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#787]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2907])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#3124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#2705] / [Intel XE#4212])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4417]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#4173]) +10 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_color@invalid-ctm-matrix-sizes.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_content_protection@atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#4633])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#323])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2286])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4494])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4294])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4294])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#776])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#776])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#310])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#301]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1421]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#2882] / [Intel XE#5338]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1397] / [Intel XE#1745])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1397])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#651]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#4543]) +7 other tests dmesg-fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4141])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2312])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2311]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#653]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#656]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#1503])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_lease@lease-unleased-connector:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#2953]) +1 other test abort
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_lease@lease-unleased-connector.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@kms_lease@lease-unleased-connector.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#616]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#4596]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2763]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2763]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1439] / [Intel XE#836])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2893]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1489])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1406])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr@psr-cursor-render.html
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#1435])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#362])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-bmg:          NOTRUN -> [FAIL][106] ([Intel XE#1729])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#362])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1123])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1123])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1126])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4837])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4837])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@read-metadata:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4837]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#688])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2322]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1392])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#1392]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1392]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1392])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#288])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#4943]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4943]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4915]) +22 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#5018])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4915]) +47 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset.html

  * igt@xe_oa@oa-formats:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2541] / [Intel XE#3573])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@xe_oa@oa-formats.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2541] / [Intel XE#3573])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#977])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2245])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#584])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_pm@s3-exec-after.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][133] -> [FAIL][134] ([Intel XE#4819]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4733])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#944]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#944])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#4208] / [i915#2575]) -> [PASS][140] +7 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][141] ([Intel XE#4543]) -> [PASS][142] +10 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [FAIL][143] ([Intel XE#1874]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#5354]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][151] ([Intel XE#2291]) -> [PASS][152] +7 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][153] ([Intel XE#3009]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_dp_aux_dev.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][155] ([Intel XE#2316]) -> [PASS][156] +12 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#4543]) -> [PASS][158] +17 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][159] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][161] ([Intel XE#1503]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][163] ([Intel XE#4596]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [SKIP][165] ([Intel XE#4950]) -> [PASS][166] +8 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_properties@crtc-properties-atomic.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][167] ([Intel XE#1435]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][170] +11 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][171] ([Intel XE#4459]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208]) -> [PASS][174] +10 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1392]) -> [PASS][176] +6 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][177] ([Intel XE#4937]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [SKIP][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204]) ([Intel XE#378]) -> ([PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [SKIP][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255]) ([Intel XE#2457]) -> ([PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-4/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [SKIP][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306]) ([Intel XE#378]) -> ([PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-466/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-466/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-466/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [SKIP][332] ([Intel XE#4945]) -> [PASS][333] +9 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#4208] / [i915#2575]) -> [SKIP][335] ([Intel XE#455])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][336] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][337] ([Intel XE#1124])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][339] ([Intel XE#316])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [SKIP][340] ([Intel XE#4947]) -> [DMESG-FAIL][341] ([Intel XE#4543])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#4208]) -> [SKIP][343] ([Intel XE#1124])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-adlp:         [SKIP][344] ([Intel XE#4947]) -> [SKIP][345] ([Intel XE#1124])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][346] ([Intel XE#4950]) -> [SKIP][347] ([Intel XE#2191])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         [SKIP][348] ([Intel XE#4950]) -> [SKIP][349] ([Intel XE#367])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#4208] / [i915#2575]) -> [SKIP][351] ([Intel XE#367])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][352] ([Intel XE#4947]) -> [SKIP][353] ([Intel XE#455] / [Intel XE#787])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][354] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][355] ([Intel XE#455] / [Intel XE#787])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][356] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][357] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][358] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][359] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-adlp:         [SKIP][360] ([Intel XE#4950]) -> [SKIP][361] ([Intel XE#373]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#4208] / [i915#2575]) -> [SKIP][363] ([Intel XE#373]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         [SKIP][364] ([Intel XE#4950]) -> [SKIP][365] ([Intel XE#455]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_content_protection@atomic.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][366] ([Intel XE#1178]) -> [SKIP][367] ([Intel XE#2341])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][368] ([Intel XE#2341]) -> [FAIL][369] ([Intel XE#1178])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208] / [i915#2575]) -> [SKIP][371] ([Intel XE#308])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-adlp:         [SKIP][372] ([Intel XE#4950]) -> [SKIP][373] ([Intel XE#308])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#4208] / [i915#2575]) -> [SKIP][375] ([Intel XE#323])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         [SKIP][376] ([Intel XE#4950]) -> [SKIP][377] ([Intel XE#323])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         [SKIP][378] ([Intel XE#4947]) -> [SKIP][379] ([Intel XE#4331])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-adlp:         [SKIP][380] ([Intel XE#4950]) -> [SKIP][381] ([Intel XE#310])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_flip@2x-flip-vs-suspend.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][382] ([Intel XE#2311]) -> [SKIP][383] ([Intel XE#2312]) +18 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][384] ([Intel XE#4141]) -> [SKIP][385] ([Intel XE#2312]) +4 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][386] ([Intel XE#2312]) -> [SKIP][387] ([Intel XE#4141]) +7 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [SKIP][389] ([Intel XE#2311]) +20 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         [SKIP][390] ([Intel XE#4947]) -> [SKIP][391] ([Intel XE#651]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#4208]) -> [SKIP][393] ([Intel XE#651]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][394] ([Intel XE#4947]) -> [SKIP][395] ([Intel XE#656]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#4208]) -> [SKIP][397] ([Intel XE#653]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-adlp:         [SKIP][398] ([Intel XE#4947]) -> [SKIP][399] ([Intel XE#653]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][401] ([Intel XE#653]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-adlp:         [SKIP][402] ([Intel XE#4947]) -> [SKIP][403] ([Intel XE#1151])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][404] ([Intel XE#2312]) -> [SKIP][405] ([Intel XE#2313]) +17 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][406] ([Intel XE#2313]) -> [SKIP][407] ([Intel XE#2312]) +16 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][408] ([Intel XE#4596]) -> [SKIP][409] ([Intel XE#5021])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][410] ([Intel XE#4962]) -> [SKIP][411] ([Intel XE#836])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#4208]) -> [SKIP][413] ([Intel XE#1489])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-adlp:         [SKIP][414] ([Intel XE#4947]) -> [SKIP][415] ([Intel XE#1489])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@pr-primary-blt:
    - shard-adlp:         [SKIP][416] ([Intel XE#4947]) -> [SKIP][417] ([Intel XE#2850] / [Intel XE#929])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_psr@pr-primary-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr@pr-primary-blt.html
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#4208]) -> [SKIP][419] ([Intel XE#2850] / [Intel XE#929])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_psr@pr-primary-blt.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_psr@pr-primary-blt.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         [SKIP][420] ([Intel XE#4945]) -> [SKIP][421] ([Intel XE#455] / [Intel XE#488])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         [SKIP][422] ([Intel XE#4945]) -> [SKIP][423] ([Intel XE#4837])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-discovery.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-discovery.html
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#4208]) -> [SKIP][425] ([Intel XE#4837])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-discovery.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         [SKIP][426] ([Intel XE#4945]) -> [SKIP][427] ([Intel XE#261] / [Intel XE#688])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_evict@evict-small-external.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         [SKIP][428] ([Intel XE#4945]) -> [SKIP][429] ([Intel XE#1392]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][430] ([Intel XE#4945]) -> [SKIP][431] ([Intel XE#288]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#4208]) -> [SKIP][433] ([Intel XE#288])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@many-malloc-mlock:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#4208]) -> [SKIP][435] ([Intel XE#4915]) +9 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exec_system_allocator@many-malloc-mlock.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_exec_system_allocator@many-malloc-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - shard-adlp:         [SKIP][436] ([Intel XE#4945]) -> [SKIP][437] ([Intel XE#4915]) +13 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-adlp:         [SKIP][438] ([Intel XE#4945]) -> [SKIP][439] ([Intel XE#4733])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#4208]) -> [SKIP][441] ([Intel XE#4733])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8430 -> IGT_8431
  * Linux: xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8 -> xe-pw-150856v1

  IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8431: 8431
  xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8: 0097539331ac0b7f5f0633992d34a8149f7246e8
  xe-pw-150856v1: 150856v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/index.html

--===============2662372277733099140==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fxi typo in Kconfig</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150856/">https://patchwork.freedesktop.org/series/150856/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150856v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3320-0097539331ac0b7f5f0633992d34a8149=
f7246e8_FULL -&gt; xe-pw-150856v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150856v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150856v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1508=
56v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-rmfb:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150856v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async=
_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
56v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tile=
d@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +15 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async_flips@crc-atomic@p=
ipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_async_flips@crc-atomic@p=
ipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/s=
hard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_bw@linear-tiling-4-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard=
-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_col=
or@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_color@invali=
d-ctm-matrix-sizes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +10 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_content_protection@atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +2 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-expired-=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_flip@2x-plai=
n-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_flip=
@blocking-wf_vblank@b-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_flip@blocki=
ng-wf_vblank@b-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-ad=
lp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tes=
ts skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_lea=
se@lease-unleased-connector.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@kms_lease@lease-=
unleased-connector.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@=
kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr@psr-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@kms_psr@psr-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_eudebug@read-metadata.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_evict@evict-small-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4=
943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-shared:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-execqueues-mmap-shared.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150856v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_exec_system_allocator@tw=
ice-large-new-bo-map-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +47 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@xe_oa@oa-formats.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">I=
ntel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-str=
eam-exec-q.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_pm@s3-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ad=
dfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/=
shard-dg2-435/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> +7 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150856v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-=
adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150856v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-4=
35/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/s=
hard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +7 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adl=
p-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +17 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/igt@kms_flip_s=
caled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_pro=
perties@crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-8/i=
gt@kms_properties@crtc-properties-atomic.html">PASS</a> +8 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-4/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1=
/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +11 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exe=
c_balancer@no-exec-parallel-userptr-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shar=
d-dg2-435/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html">PASS</=
a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +6 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937"=
>Intel XE#4937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f72=
46e8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a814=
9f7246e8/shard-lnl-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34=
a8149f7246e8/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f063399=
2d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f06=
33992d34a8149f7246e8/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f=
5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac=
0b7f5f0633992d34a8149f7246e8/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-00975393=
31ac0b7f5f0633992d34a8149f7246e8/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097=
539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-=
0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-lnl-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-=
lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e=
8/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150856v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150856v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150856v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f72=
46e8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a814=
9f7246e8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34=
a8149f7246e8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f063399=
2d34a8149f7246e8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f06=
33992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f=
5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac=
0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-00975393=
31ac0b7f5f0633992d34a8149f7246e8/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097=
539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-=
0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e=
8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150856v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f=
7246e8/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34=
a8149f7246e8/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f063=
3992d34a8149f7246e8/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7=
f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-009753933=
1ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-009=
7539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
20-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f72=
46e8/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f0633992d34a8=
149f7246e8/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f063399=
2d34a8149f7246e8/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac0b7f5f=
0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-0097539331ac=
0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-009753=
9331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3320-=
0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-433/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0856v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150856v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_vm@l=
arge-misaligned-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/i=
gt@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +9 other tests pa=
ss</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_at=
omic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big=
_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shar=
d-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/sha=
rd-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel=
 XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150856v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0856v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_bw@=
connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/s=
hard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_bw@=
linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-=
9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
56v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_ccs=
@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-a=
dlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_ccs=
@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50856v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2=
-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_cha=
melium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/i=
gt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 oth=
er test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ch=
amelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/=
shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#=
373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_con=
tent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@kms_con=
tent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-1/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
856v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adl=
p-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-464/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150856v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_dp_=
linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-4/i=
gt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_fli=
p@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@kms_flip@=
2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150856v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150856v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150856v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard=
-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150856v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150856v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-=
adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v=
1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +1 other test skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
56v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0856v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_pm_=
rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-6/igt@k=
ms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-4=
33/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_psr=
2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3=
/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@kms_psr=
@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-9/igt@kms_psr@pr-pri=
mary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@kms_ps=
r@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-435/igt@kms_psr@pr-p=
rimary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_ccs@=
ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_ccs@ctrl-sur=
f-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_eude=
bug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-1/igt@xe=
_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_eud=
ebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-463/igt@=
xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_evic=
t@evict-small-external.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/igt@xe_evic=
t@evict-small-external.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#49=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0856v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bind=
execqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adl=
p-9/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exe=
c_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg=
2-435/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#28=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_exe=
c_system_allocator@many-malloc-mlock.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-=
466/igt@xe_exec_system_allocator@many-malloc-mlock.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_exec=
_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150856v1/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-m=
any-mmap-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-adlp-6/igt@xe_pxp@=
pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-adlp-3/i=
gt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8/shard-dg2-463/igt@xe_pxp=
@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150856v1/shard-dg2-466/=
igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8430 -&gt; IGT_8431</li>
<li>Linux: xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8 -&gt; xe-pw-150=
856v1</li>
</ul>
<p>IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8431: 8431<br />
  xe-3320-0097539331ac0b7f5f0633992d34a8149f7246e8: 0097539331ac0b7f5f06339=
92d34a8149f7246e8<br />
  xe-pw-150856v1: 150856v1</p>

</body>
</html>

--===============2662372277733099140==--
