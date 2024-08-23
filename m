Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29420C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 06:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9A510EC2A;
	Fri, 23 Aug 2024 06:06:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D1A10EC2A;
 Fri, 23 Aug 2024 06:06:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5920870977241348897=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/lnl=3A_Drop_force=5Fprob?=
 =?utf-8?q?e_requirement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 06:06:19 -0000
Message-ID: <172439317985.727910.11333936924488226008@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
In-Reply-To: <20240822224615.793540-1-lucas.demarchi@intel.com>
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

--===============5920870977241348897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lnl: Drop force_probe requirement
URL   : https://patchwork.freedesktop.org/series/137671/
State : failure

== Summary ==

CI Bug Log - changes from xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10_full -> xe-pw-137671v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137671v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137671v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137671v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][1] +19 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][7] ([Intel XE#1201] / [Intel XE#651]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][9] +7 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:
    - {shard-bmg}:        [PASS][10] -> [DMESG-WARN][11] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html

  * igt@kms_async_flips@crc@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][12] ([Intel XE#1656]) -> [DMESG-FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-dp-2.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - {shard-bmg}:        NOTRUN -> [SKIP][14] +44 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:
    - {shard-bmg}:        [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html

  * igt@kms_pm_rpm@i2c:
    - {shard-bmg}:        [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-3/igt@kms_pm_rpm@i2c.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_pm_rpm@i2c.html

  
Known issues
------------

  Here are the changes found in xe-pw-137671v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#2226]) +3 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#1426]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1426]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#1659])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1407])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1204])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1231]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1512])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1399])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][41] ([Intel XE#2576]) +15 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#314])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#314])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#306])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#323])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#599])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1138] / [Intel XE#1201])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1138])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#886]) +6 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#324]) +3 other tests dmesg-fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1401] / [Intel XE#1745])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][65] -> [FAIL][66] ([Intel XE#1874]) +6 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#656]) +12 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#651]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#324]) +5 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#361]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#870])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#836])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1489])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1406])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1149] / [Intel XE#1201])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#362])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][88] -> [FAIL][89] ([Intel XE#771] / [Intel XE#899])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][90] -> [FAIL][91] ([Intel XE#899])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#899])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][94] -> [DMESG-WARN][95] ([Intel XE#1551]) +3 other tests dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#2443]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_vrr@max-min.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#756])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1126] / [Intel XE#1201])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [TIMEOUT][101] ([Intel XE#1473]) +1 other test timeout
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#688]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][104] ([Intel XE#1600])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#261])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@many-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][106] ([Intel XE#2226])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_exec_basic@many-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#288]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2229]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#2229])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#512])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#512])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#378])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#378])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][119] -> [DMESG-WARN][120] ([Intel XE#2019]) +6 other tests dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_module_load@reload.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_module_load@reload.html
    - shard-lnl:          [PASS][121] -> [ABORT][122] ([Intel XE#2317])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@xe_module_load@reload.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_module_load@reload.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#2541])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#2541])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#977])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_pm@d3cold-basic.html
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#584])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][130] -> [ABORT][131] ([Intel XE#1358] / [Intel XE#1607])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][132] -> [FAIL][133] ([Intel XE#958])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#944])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#944])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#944])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][137] -> [FAIL][138] ([Intel XE#1081])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-lnl:          [FAIL][139] ([Intel XE#2604] / [Intel XE#911]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][141] ([Intel XE#911]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        [DMESG-WARN][143] ([Intel XE#1033]) -> [PASS][144] +7 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][145] ([Intel XE#1701]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#1426]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][149] ([Intel XE#1426]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][151] ([Intel XE#1426]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][153] ([Intel XE#877]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][155] ([Intel XE#1231]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][157] ([Intel XE#1204]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-lnl:          [DMESG-WARN][159] -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@kms_color@invalid-ctm-matrix-sizes.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][161] ([Intel XE#1541]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][163] ([Intel XE#886]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#324]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][167] ([Intel XE#1874]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [FAIL][169] ([Intel XE#1861]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][171] ([Intel XE#1503]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [INCOMPLETE][173] -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          [FAIL][175] ([Intel XE#2604]) -> [PASS][176] +10 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - {shard-bmg}:        [FAIL][177] ([Intel XE#2604]) -> [PASS][178] +10 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-adlp:         [SKIP][179] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][181] ([Intel XE#718]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][183] ([Intel XE#1201]) -> [PASS][184] +11 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#899]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][187] ([Intel XE#1473]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][189] ([Intel XE#1473]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][191] ([Intel XE#1069]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - {shard-bmg}:        [DMESG-WARN][193] ([Intel XE#877]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][195] ([Intel XE#2105]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - {shard-bmg}:        [INCOMPLETE][197] -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-5/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset:
    - shard-lnl:          [DMESG-FAIL][199] ([Intel XE#1620]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@xe_gt_freq@freq_reset.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@xe_gt_freq@freq_reset.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][201] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][203] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [ABORT][205] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][207] ([Intel XE#958]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_render_copy@render-square@render-ymajor-256x256:
    - shard-adlp:         [DMESG-WARN][209] ([Intel XE#2226]) -> [PASS][210] +9 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@xe_render_copy@render-square@render-ymajor-256x256.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_render_copy@render-square@render-ymajor-256x256.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#316]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][214] ([Intel XE#316]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][215] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1124]) -> [SKIP][218] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][219] ([Intel XE#324]) -> [FAIL][220] ([Intel XE#1231])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][222] ([Intel XE#1124]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][223] ([Intel XE#1201]) -> [SKIP][224] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][226] ([Intel XE#607]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][228] ([Intel XE#367]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2191]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#2191])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#367]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#787]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][236] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][239] ([Intel XE#1201]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][242] ([Intel XE#787]) +48 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#314]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#314])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][246] ([Intel XE#306])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#306]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#373]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][252] ([Intel XE#373]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         [SKIP][253] ([Intel XE#1201]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#455])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][256] ([Intel XE#308])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][258] ([Intel XE#323]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][260] ([Intel XE#307])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][262] ([Intel XE#776])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1138]) -> [SKIP][264] ([Intel XE#1138] / [Intel XE#1201])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#455]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][267] ([i915#5274]) -> [SKIP][268] ([Intel XE#1201] / [i915#5274])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#651]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][272] ([Intel XE#651]) +22 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][273] ([Intel XE#1201]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][278] ([Intel XE#653]) +21 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1158]) -> [SKIP][280] ([Intel XE#1158] / [Intel XE#1201])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][281] ([Intel XE#2185]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#656])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#653]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][285] ([Intel XE#1201]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][288] ([Intel XE#356])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][290] ([Intel XE#455]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_panel_fitting@legacy.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#498]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][296] ([Intel XE#2318]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][298] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][300] ([Intel XE#870])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#870]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#870])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][304] ([Intel XE#908])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1129]) -> [SKIP][306] ([Intel XE#1129] / [Intel XE#1201])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][307] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][308] ([Intel XE#1204])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#908]) -> [SKIP][310] ([Intel XE#1201] / [Intel XE#908])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][312] ([Intel XE#1489]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1489]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1122]) -> [SKIP][316] ([Intel XE#1122] / [Intel XE#1201])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][318] ([Intel XE#1122]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#929]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][322] ([Intel XE#929]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][324] ([Intel XE#327])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][326] ([Intel XE#1127])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#327]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#327])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][329] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][330] ([Intel XE#1201])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][332] ([Intel XE#1729])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#362])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][336] ([Intel XE#1091])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][338] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][340] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1123]) -> [SKIP][342] ([Intel XE#1123] / [Intel XE#1201])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][344] ([Intel XE#1126])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][345] ([Intel XE#1473]) -> [INCOMPLETE][346] ([Intel XE#1195] / [Intel XE#1473])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][347] ([Intel XE#1000]) -> [TIMEOUT][348] ([Intel XE#1473])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][350] ([Intel XE#288]) +16 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#288]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [SKIP][353] ([Intel XE#1192]) -> [SKIP][354] ([Intel XE#2229])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@xe_live_ktest@xe_bo.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#512]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#512])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_mmap@small-bar.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2541]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][360] ([Intel XE#2541]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][362] ([Intel XE#979])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][364] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_pm@d3cold-basic.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#944]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][368] ([Intel XE#944])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][370] ([Intel XE#1760])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2185
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2576
  [Intel XE#2604]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2604
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7984 -> IGT_7986
  * Linux: xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10 -> xe-pw-137671v1

  IGT_7984: 7984
  IGT_7986: 7986
  xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10: de61b881027b40ad8efdc1c08aab4282f7318b10
  xe-pw-137671v1: 137671v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/index.html

--===============5920870977241348897==
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
<tr><td><b>Series:</b></td><td>drm/xe/lnl: Drop force_probe requirement</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137671/">https://patchwork.freedesktop.org/series/137671/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10_full -&gt; xe-pw-137671v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137671v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137671v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137671v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-3/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_pm_rpm@i2c.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137671v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2576">Intel XE#2576</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_exec_fault_mode@many-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +6 other tests dmesg-warn</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2604">Intel XE#2604</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@kms_color@invalid-ctm-matrix-sizes.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_color@invalid-ctm-matrix-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2604">Intel XE#2604</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2604">Intel XE#2604</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-bmg-5/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-bmg-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-4/igt@xe_gt_freq@freq_reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@xe_gt_freq@freq_reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-square@render-ymajor-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@xe_render_copy@render-square@render-ymajor-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@xe_render_copy@render-square@render-ymajor-256x256.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2185">Intel XE#2185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-lnl-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-lnl-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-435/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10/shard-dg2-435/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137671v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7984 -&gt; IGT_7986</li>
<li>Linux: xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10 -&gt; xe-pw-137671v1</li>
</ul>
<p>IGT_7984: 7984<br />
  IGT_7986: 7986<br />
  xe-1816-de61b881027b40ad8efdc1c08aab4282f7318b10: de61b881027b40ad8efdc1c08aab4282f7318b10<br />
  xe-pw-137671v1: 137671v1</p>

</body>
</html>

--===============5920870977241348897==--
