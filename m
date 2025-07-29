Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B964C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 16:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D246310E07B;
	Tue, 29 Jul 2025 16:01:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683610E07B;
 Tue, 29 Jul 2025 16:01:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1864676869570701860=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_use_drm-=3Edeb?=
 =?utf-8?q?ugfs=5Froot_when_creating_debugfs_files_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 16:01:45 -0000
Message-ID: <175380490579.196634.9708762319967853214@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1753782998.git.jani.nikula@intel.com>
In-Reply-To: <cover.1753782998.git.jani.nikula@intel.com>
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

--===============1864676869570701860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: use drm->debugfs_root when creating debugfs files (rev2)
URL   : https://patchwork.freedesktop.org/series/150106/
State : failure

== Summary ==

CI Bug Log - changes from xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4_FULL -> xe-pw-150106v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150106v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150106v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150106v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  
Known issues
------------

  Here are the changes found in xe-pw-150106v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#4672])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@core_getversion@all-cards.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#4963])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2134]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@fbdev@nullptr.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#3157])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +188 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#787]) +11 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#2907])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#4947]) +27 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#3862]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#3124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][29] ([Intel XE#1727] / [Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4416]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#1178]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#309]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4494] / [i915#3804])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#4294])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#310]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4543]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#3098])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#3098])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455]) +8 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2293]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#651]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4947])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#658])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#653]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#656]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4950]) +124 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#616]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#5020])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#5020])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#870])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1129])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#4962]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_pm_rpm@i2c.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1489]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1489])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2939] / [Intel XE#5585])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#1435])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1126])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#4837])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#1392]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#288])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#288] / [Intel XE#5561]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][94] -> [DMESG-WARN][95] ([Intel XE#3876])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@evict-malloc:
    - shard-bmg:          [PASS][96] -> [ABORT][97] ([Intel XE#3970])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_exec_system_allocator@evict-malloc.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:
    - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#3428])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race.html

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#4915] / [Intel XE#5560]) +60 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4915]) +18 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4945]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#4945]) +597 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-new.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_mmap@pci-membarrier:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#5100])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#5679]) +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_module_load@many-reload.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3573]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#977])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#944])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4130])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][113] ([Intel XE#4672]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][115] ([Intel XE#4674]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][117] -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][119] ([Intel XE#2134]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@fbdev@info.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@fbdev@info.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [SKIP][121] ([Intel XE#4950]) -> [PASS][122] +104 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][123] ([Intel XE#827]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [TIMEOUT][125] -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][127] ([Intel XE#4947]) -> [PASS][128] +19 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][129] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][130] +2 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][133] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][137] ([Intel XE#2373]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][139] ([Intel XE#2316]) -> [PASS][140] +2 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][141] ([Intel XE#4543]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][143] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@nonexisting-fb:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][146] +9 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-8/igt@kms_flip@nonexisting-fb.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_flip@nonexisting-fb.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][147] ([Intel XE#1503]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_hdr@static-swap.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_hdr@static-swap.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [SKIP][149] ([Intel XE#4962]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [SKIP][151] ([Intel XE#4962]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_properties@invalid-properties-legacy:
    - shard-adlp:         [SKIP][153] ([Intel XE#4950]) -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_properties@invalid-properties-legacy.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - shard-adlp:         [SKIP][155] ([Intel XE#4945]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1392]) -> [PASS][158] +9 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][159] ([Intel XE#5018]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][161] ([Intel XE#4945]) -> [PASS][162] +516 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#4819]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][165] ([Intel XE#4947]) -> [SKIP][166] ([Intel XE#2327]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][167] ([Intel XE#2327]) -> [SKIP][168] ([Intel XE#4947]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][169] ([Intel XE#4947]) -> [SKIP][170] ([Intel XE#1124]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][171] ([Intel XE#2328]) -> [SKIP][172] ([Intel XE#4947])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][173] ([Intel XE#1124]) -> [SKIP][174] ([Intel XE#4947]) +14 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][175] ([Intel XE#4947]) -> [SKIP][176] ([Intel XE#2328])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][177] ([Intel XE#607]) -> [SKIP][178] ([Intel XE#4947])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][179] ([Intel XE#4947]) -> [SKIP][180] ([Intel XE#1124])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][181] ([Intel XE#4950]) -> [SKIP][182] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][183] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][184] ([Intel XE#4950]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][185] ([Intel XE#367]) -> [SKIP][186] ([Intel XE#4950]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][187] ([Intel XE#4950]) -> [SKIP][188] ([Intel XE#367]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         [SKIP][189] ([Intel XE#4947]) -> [SKIP][190] ([Intel XE#455] / [Intel XE#787])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][191] ([Intel XE#4947]) -> [SKIP][192] ([Intel XE#2887]) +15 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][193] ([Intel XE#4947]) -> [SKIP][194] ([Intel XE#2652] / [Intel XE#787])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][195] ([Intel XE#3432]) -> [SKIP][196] ([Intel XE#4947]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][197] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#4947])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][199] ([Intel XE#4947]) -> [SKIP][200] ([Intel XE#3432]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][201] ([Intel XE#2887]) -> [SKIP][202] ([Intel XE#4947]) +20 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][204] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][205] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][206] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][207] ([Intel XE#2724]) -> [SKIP][208] ([Intel XE#4947])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][209] ([Intel XE#4947]) -> [SKIP][210] ([Intel XE#2724])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][211] ([Intel XE#4950]) -> [SKIP][212] ([Intel XE#2325]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][213] ([Intel XE#2325]) -> [SKIP][214] ([Intel XE#4950]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_chamelium_color@degamma.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][215] ([Intel XE#4950]) -> [SKIP][216] ([Intel XE#2252]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         [SKIP][217] ([Intel XE#4950]) -> [SKIP][218] ([Intel XE#373])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][219] ([Intel XE#2252]) -> [SKIP][220] ([Intel XE#4950]) +13 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][221] ([Intel XE#1178]) -> [SKIP][222] ([Intel XE#2341])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_content_protection@atomic.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][223] ([Intel XE#4950]) -> [SKIP][224] ([Intel XE#2390])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][225] ([Intel XE#1178]) -> [SKIP][226] ([Intel XE#4950])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_content_protection@legacy.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][227] ([Intel XE#4950]) -> [FAIL][228] ([Intel XE#1178]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][229] ([Intel XE#2341]) -> [SKIP][230] ([Intel XE#4950])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][231] ([Intel XE#4950]) -> [SKIP][232] ([Intel XE#2341])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][233] ([Intel XE#4950]) -> [SKIP][234] ([Intel XE#2320]) +7 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][235] ([Intel XE#2320]) -> [SKIP][236] ([Intel XE#4950]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][237] ([Intel XE#2321]) -> [SKIP][238] ([Intel XE#4950]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][239] ([Intel XE#4950]) -> [SKIP][240] ([Intel XE#2321])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         [SKIP][241] ([Intel XE#4950]) -> [SKIP][242] ([Intel XE#309])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][243] ([Intel XE#4950]) -> [FAIL][244] ([Intel XE#4633]) +1 other test fail
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][245] ([Intel XE#2286]) -> [SKIP][246] ([Intel XE#4950]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][247] ([Intel XE#1340]) -> [SKIP][248] ([Intel XE#4950])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][249] ([Intel XE#4947]) -> [SKIP][250] ([Intel XE#4354])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][251] ([Intel XE#2244]) -> [SKIP][252] ([Intel XE#4947]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_dsc@dsc-basic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][253] ([Intel XE#4947]) -> [SKIP][254] ([Intel XE#2244]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][255] ([Intel XE#4945]) -> [SKIP][256] ([Intel XE#4422])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][257] ([Intel XE#5425]) -> [SKIP][258] ([Intel XE#4947])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][259] ([Intel XE#776]) -> [SKIP][260] ([Intel XE#4947])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][261] ([Intel XE#4950]) -> [SKIP][262] ([Intel XE#2373])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][263] ([Intel XE#4950]) -> [SKIP][264] ([Intel XE#1138])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][265] ([Intel XE#2374]) -> [SKIP][266] ([Intel XE#4950])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][267] ([Intel XE#2316]) -> [SKIP][268] ([Intel XE#4950]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [DMESG-WARN][269] ([Intel XE#4543]) -> [DMESG-FAIL][270] ([Intel XE#4543]) +1 other test dmesg-fail
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][271] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][272] ([Intel XE#4947]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][273] ([Intel XE#2380]) -> [SKIP][274] ([Intel XE#4947])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][275] ([Intel XE#4947]) -> [SKIP][276] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2311]) -> [SKIP][278] ([Intel XE#4947]) +41 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][279] ([Intel XE#4947]) -> [SKIP][280] ([Intel XE#651])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#2311]) -> [SKIP][282] ([Intel XE#2312]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][283] ([Intel XE#4947]) -> [SKIP][284] ([Intel XE#2311]) +36 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][285] ([Intel XE#5390]) -> [SKIP][286] ([Intel XE#4947]) +15 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][287] ([Intel XE#2312]) -> [SKIP][288] ([Intel XE#4947]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][289] ([Intel XE#4947]) -> [SKIP][290] ([Intel XE#5427])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][291] ([Intel XE#5390]) -> [SKIP][292] ([Intel XE#2312]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][293] ([Intel XE#4947]) -> [SKIP][294] ([Intel XE#5390]) +15 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#5390]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][297] ([Intel XE#2312]) -> [SKIP][298] ([Intel XE#2311]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][299] ([Intel XE#4947]) -> [SKIP][300] ([Intel XE#2352])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][301] ([Intel XE#4947]) -> [SKIP][302] ([Intel XE#2313]) +38 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][303] ([Intel XE#2352]) -> [SKIP][304] ([Intel XE#4947])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][305] ([Intel XE#4947]) -> [SKIP][306] ([Intel XE#5672])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#4947]) +38 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#2313]) +12 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][311] ([Intel XE#2313]) -> [SKIP][312] ([Intel XE#2312]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][313] ([Intel XE#4947]) -> [SKIP][314] ([Intel XE#656])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][315] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][316] ([Intel XE#4950])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][317] ([Intel XE#2934]) -> [SKIP][318] ([Intel XE#4947])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][319] ([Intel XE#346]) -> [SKIP][320] ([Intel XE#4947])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][321] ([Intel XE#2927]) -> [SKIP][322] ([Intel XE#4947])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][323] ([Intel XE#2501]) -> [SKIP][324] ([Intel XE#4950])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][325] ([Intel XE#4947]) -> [SKIP][326] ([Intel XE#4329])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][327] ([Intel XE#2393]) -> [SKIP][328] ([Intel XE#4950])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][329] ([Intel XE#4596]) -> [SKIP][330] ([Intel XE#5021])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][331] ([Intel XE#4950]) -> [SKIP][332] ([Intel XE#5020])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][333] ([Intel XE#4950]) -> [SKIP][334] ([Intel XE#2763])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][335] ([Intel XE#2763]) -> [SKIP][336] ([Intel XE#4950]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][337] ([Intel XE#4947]) -> [SKIP][338] ([Intel XE#870])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][339] ([Intel XE#4947]) -> [SKIP][340] ([Intel XE#2392])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][341] ([Intel XE#4962]) -> [SKIP][342] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][343] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][344] ([Intel XE#4962])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][345] ([Intel XE#4947]) -> [SKIP][346] ([Intel XE#1489]) +9 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         [SKIP][347] ([Intel XE#4947]) -> [SKIP][348] ([Intel XE#1489])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][349] ([Intel XE#1489]) -> [SKIP][350] ([Intel XE#4947]) +11 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][351] ([Intel XE#2387]) -> [SKIP][352] ([Intel XE#4947])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][353] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][354] ([Intel XE#4947]) +21 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][355] ([Intel XE#4947]) -> [SKIP][356] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][357] ([Intel XE#4947]) -> [SKIP][358] ([Intel XE#2414])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][359] ([Intel XE#2330]) -> [SKIP][360] ([Intel XE#4950])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][361] ([Intel XE#4950]) -> [SKIP][362] ([Intel XE#3414] / [Intel XE#3904])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][363] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][364] ([Intel XE#4950]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][365] ([Intel XE#4950]) -> [SKIP][366] ([Intel XE#2413])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][367] ([Intel XE#2413]) -> [SKIP][368] ([Intel XE#4950])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][369] ([Intel XE#4950]) -> [SKIP][370] ([Intel XE#1435])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][371] ([Intel XE#4950]) -> [SKIP][372] ([Intel XE#2426])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][373] ([Intel XE#2450]) -> [SKIP][374] ([Intel XE#4950])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][375] ([Intel XE#2168]) -> [SKIP][376] ([Intel XE#4950])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_vrr@cmrr.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][377] ([Intel XE#1499]) -> [SKIP][378] ([Intel XE#4950])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_vrr@flipline.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][379] ([Intel XE#4950]) -> [SKIP][380] ([Intel XE#2168])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_vrr@lobf.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][381] ([Intel XE#4950]) -> [SKIP][382] ([Intel XE#1499])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][383] ([Intel XE#2504]) -> [SKIP][384] ([Intel XE#4945])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][385] ([Intel XE#4945]) -> [SKIP][386] ([Intel XE#4837]) +15 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-adlp:         [SKIP][387] ([Intel XE#4945]) -> [SKIP][388] ([Intel XE#4837] / [Intel XE#5565])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][389] ([Intel XE#4837]) -> [SKIP][390] ([Intel XE#4945]) +20 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][391] ([Intel XE#4945]) -> [SKIP][392] ([Intel XE#4518])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][393] ([Intel XE#2322]) -> [SKIP][394] ([Intel XE#4945]) +11 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][395] ([Intel XE#4945]) -> [SKIP][396] ([Intel XE#2322]) +8 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][397] ([Intel XE#4943]) -> [SKIP][398] ([Intel XE#4945]) +37 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:
    - shard-adlp:         [SKIP][399] ([Intel XE#4945]) -> [SKIP][400] ([Intel XE#4915] / [Intel XE#5560]) +5 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][401] ([Intel XE#4945]) -> [SKIP][402] ([Intel XE#4943]) +23 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][403] ([Intel XE#4945]) -> [SKIP][404] ([Intel XE#2248])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][405] ([Intel XE#4945]) -> [SKIP][406] ([Intel XE#1420])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][407] ([Intel XE#2236]) -> [SKIP][408] ([Intel XE#4945])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][409] ([Intel XE#1173]) -> [SKIP][410] ([Intel XE#1061])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@xe_peer2peer@write.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][411] ([Intel XE#4945]) -> [SKIP][412] ([Intel XE#2284])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][413] ([Intel XE#2284]) -> [SKIP][414] ([Intel XE#4945]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][415] ([Intel XE#4733]) -> [SKIP][416] ([Intel XE#4945]) +2 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [SKIP][417] ([Intel XE#4945]) -> [SKIP][418] ([Intel XE#4733]) +4 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][419] ([Intel XE#4945]) -> [SKIP][420] ([Intel XE#944]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_query@multigpu-query-config.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][421] ([Intel XE#944]) -> [SKIP][422] ([Intel XE#4945]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][423] ([Intel XE#4945]) -> [SKIP][424] ([Intel XE#4130]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][425] ([Intel XE#4130]) -> [SKIP][426] ([Intel XE#4945]) +2 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][427] ([Intel XE#3342]) -> [SKIP][428] ([Intel XE#4945])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][429] ([Intel XE#4945]) -> [SKIP][430] ([Intel XE#4273])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][431] ([Intel XE#4945]) -> [SKIP][432] ([Intel XE#3342])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
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
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4 -> xe-pw-150106v2

  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4: 23f7b89faeb0f3aed0ea60022847ac24339bdea4
  xe-pw-150106v2: 150106v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/index.html

--===============1864676869570701860==
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
<tr><td><b>Series:</b></td><td>drm/i915: use drm-&gt;debugfs_root when creating debugfs files (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150106/">https://patchwork.freedesktop.org/series/150106/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4_FULL -&gt; xe-pw-150106v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150106v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150106v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150106v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150106v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +188 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_exec_system_allocator@evict-malloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +597 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679">Intel XE#5679</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@fbdev@info.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> +104 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-8/igt@kms_flip@nonexisting-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_flip@nonexisting-fb.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_hdr@static-swap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_properties@invalid-properties-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">PASS</a> +516 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-466/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150106v2/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4 -&gt; xe-pw-150106v2</li>
</ul>
<p>IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3482-23f7b89faeb0f3aed0ea60022847ac24339bdea4: 23f7b89faeb0f3aed0ea60022847ac24339bdea4<br />
  xe-pw-150106v2: 150106v2</p>

</body>
</html>

--===============1864676869570701860==--
