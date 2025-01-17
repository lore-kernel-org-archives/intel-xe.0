Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079EAC02185
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 17:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AB610EB60;
	Fri, 17 Jan 2025 17:57:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E19910EB5F;
 Fri, 17 Jan 2025 17:57:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3883204466143656494=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_Provide_more_i?=
 =?utf-8?q?nformation_on_display_faults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 17:57:34 -0000
Message-ID: <173713665456.801064.10002080422256134108@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
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

--===============3883204466143656494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Provide more information on display faults (rev2)
URL   : https://patchwork.freedesktop.org/series/143626/
State : failure

== Summary ==

CI Bug Log - changes from xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88_full -> xe-pw-143626v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143626v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143626v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143626v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@d-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-7/igt@kms_pm_rpm@drm-resources-equal.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][9] ([Intel XE#1033]) -> [DMESG-WARN][10] +3 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][11] ([Intel XE#1033]) -> [DMESG-FAIL][12] +22 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][13] ([Intel XE#1178]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][15] ([Intel XE#2423]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][17] ([Intel XE#2423]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  
Known issues
------------

  Here are the changes found in xe-pw-143626v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#3440])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@core_getversion@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#1885]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2134]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@fbdev@info.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#827]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#3908]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2136]) +18 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [PASS][31] -> [INCOMPLETE][32] ([Intel XE#3225])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1407]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1428])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1124]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +118 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3862]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +23 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#787]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2705]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#314]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#3304])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1468])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2321]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2423]) +78 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#877])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#3226]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1340])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#2597])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1421]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#3321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301] / [Intel XE#3321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2597]) +2 other tests incomplete
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#2597])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#455]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#651]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#651])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#651]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#656]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#658])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#653]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#605])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#3374] / [Intel XE#3544])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2925])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#616]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2763]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#1430])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#2446]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_pm_rpm@cursor.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1489])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1406]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#3414] / [Intel XE#3904])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#2953]) +11 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-8/igt@kms_sequence@get-busy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-8/igt@kms_sequence@get-busy.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#899]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_writeback@writeback-check-output:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#756])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_writeback@writeback-check-output.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1062])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2905]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2905]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#688]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1392])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#1392]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1392]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#1130]) +182 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#288]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2905]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1192])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2229])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2541] / [Intel XE#3573])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#1173])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2284] / [Intel XE#366])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][123] -> [ABORT][124] ([Intel XE#1358] / [Intel XE#1794])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-433/igt@xe_pm@s2idle-mocs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][125] -> [ABORT][126] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#944])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_query@multigpu-query-oa-units.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][129] ([Intel XE#1885]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@core_hotunplug@hotrebind.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][131] ([Intel XE#2134]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@fbdev@read.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@fbdev@read.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [DMESG-WARN][133] ([Intel XE#2953]) -> [PASS][134] +7 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][135] ([Intel XE#3908]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][137] ([Intel XE#2136]) -> [PASS][138] +14 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#877]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][141] ([Intel XE#2291]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][145] ([Intel XE#301]) -> [PASS][146] +6 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][149] ([Intel XE#886]) -> [PASS][150] +4 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][151] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-bmg:          [SKIP][153] ([Intel XE#2423]) -> [PASS][154] +59 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_plane_multiple@tiling-none.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][155] ([Intel XE#2571]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][157] ([Intel XE#2446]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [SKIP][159] ([Intel XE#1130]) -> [PASS][160] +163 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1392]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [ABORT][163] ([Intel XE#2625]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][165] ([Intel XE#1192]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][167] ([Intel XE#3546]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][169] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][171] ([Intel XE#2423]) -> [SKIP][172] ([Intel XE#2370])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][173] ([Intel XE#2136]) -> [SKIP][174] ([Intel XE#2327]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][175] ([Intel XE#2327]) -> [SKIP][176] ([Intel XE#2136]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][177] ([Intel XE#2136]) -> [SKIP][178] ([Intel XE#2328])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][179] ([Intel XE#610]) -> [SKIP][180] ([Intel XE#2136])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][181] ([Intel XE#2136]) -> [SKIP][182] ([Intel XE#1124]) +10 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][183] ([Intel XE#607]) -> [SKIP][184] ([Intel XE#2136]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][185] ([Intel XE#2136]) -> [SKIP][186] ([Intel XE#610])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][187] ([Intel XE#1124]) -> [SKIP][188] ([Intel XE#2136]) +9 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][189] ([Intel XE#2423]) -> [SKIP][190] ([Intel XE#2314] / [Intel XE#2894])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][191] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][192] ([Intel XE#2423])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][193] ([Intel XE#367]) -> [SKIP][194] ([Intel XE#2423]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][195] ([Intel XE#2423]) -> [SKIP][196] ([Intel XE#367])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][197] ([Intel XE#2136]) -> [SKIP][198] ([Intel XE#2887]) +14 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][199] ([Intel XE#2887]) -> [SKIP][200] ([Intel XE#2136]) +12 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][201] ([Intel XE#2136]) -> [SKIP][202] ([Intel XE#3432])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][203] ([Intel XE#3432]) -> [SKIP][204] ([Intel XE#2136]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][205] ([Intel XE#2136]) -> [SKIP][206] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][207] ([Intel XE#2724]) -> [SKIP][208] ([Intel XE#2136])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_cdclk@mode-transition.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][209] ([Intel XE#2252]) -> [SKIP][210] ([Intel XE#2423]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][211] ([Intel XE#2325]) -> [SKIP][212] ([Intel XE#2423]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][213] ([Intel XE#2423]) -> [SKIP][214] ([Intel XE#2325])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][215] ([Intel XE#2423]) -> [SKIP][216] ([Intel XE#2252]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][217] ([Intel XE#2423]) -> [SKIP][218] ([Intel XE#2341]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_content_protection@atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [FAIL][219] ([Intel XE#1178]) -> [INCOMPLETE][220] ([Intel XE#2715])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_content_protection@atomic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][221] ([Intel XE#1178]) -> [SKIP][222] ([Intel XE#2423])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][223] ([Intel XE#2423]) -> [SKIP][224] ([Intel XE#2320]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][225] ([Intel XE#2321]) -> [SKIP][226] ([Intel XE#2423]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][227] ([Intel XE#2320]) -> [SKIP][228] ([Intel XE#2423]) +6 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][229] ([Intel XE#2423]) -> [SKIP][230] ([Intel XE#2321])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][231] ([Intel XE#2286]) -> [SKIP][232] ([Intel XE#2423])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][233] ([Intel XE#2423]) -> [SKIP][234] ([Intel XE#2291]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][235] ([Intel XE#2423]) -> [SKIP][236] ([Intel XE#1340])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][237] ([Intel XE#2423]) -> [SKIP][238] ([Intel XE#3009])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_dp_aux_dev.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][239] ([Intel XE#2244]) -> [SKIP][240] ([Intel XE#2136])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_dsc@dsc-with-formats.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#776])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][243] ([Intel XE#2372]) -> [SKIP][244] ([Intel XE#2423])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_feature_discovery@chamelium.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][245] ([Intel XE#3007]) -> [SKIP][246] ([Intel XE#2423]) +26 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_feature_discovery@display-1x.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][247] ([Intel XE#2423]) -> [INCOMPLETE][248] ([Intel XE#2597])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][249] ([Intel XE#2316]) -> [SKIP][250] ([Intel XE#2423]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][251] ([Intel XE#2423]) -> [SKIP][252] ([Intel XE#2316]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][253] ([Intel XE#2136]) -> [SKIP][254] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][255] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][256] ([Intel XE#2136]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2312]) -> [SKIP][258] ([Intel XE#2311]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#2311]) +18 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][261] ([Intel XE#2136]) -> [FAIL][262] ([Intel XE#2333]) +6 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2312]) -> [FAIL][264] ([Intel XE#2333]) +2 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#2312]) +27 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [FAIL][267] ([Intel XE#2333]) -> [SKIP][268] ([Intel XE#2136]) +15 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2136]) +24 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2136]) +12 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#2352])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][275] ([Intel XE#2312]) -> [SKIP][276] ([Intel XE#2313]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2313]) -> [SKIP][278] ([Intel XE#2136]) +24 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][279] ([Intel XE#2136]) -> [SKIP][280] ([Intel XE#2350])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][282] ([Intel XE#2136]) +27 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#2313]) +20 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#2934])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][287] ([Intel XE#2927]) -> [SKIP][288] ([Intel XE#2136])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2927])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][291] ([Intel XE#2486]) -> [SKIP][292] ([Intel XE#2423])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_panel_fitting@legacy.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][293] ([Intel XE#2493]) -> [SKIP][294] ([Intel XE#2423])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          [SKIP][295] ([Intel XE#2763]) -> [SKIP][296] ([Intel XE#2423])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][297] ([Intel XE#2423]) -> [SKIP][298] ([Intel XE#2763]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][299] ([Intel XE#2136]) -> [SKIP][300] ([Intel XE#870])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][301] ([Intel XE#870]) -> [SKIP][302] ([Intel XE#2136]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_pm_backlight@fade.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][303] ([Intel XE#2392]) -> [SKIP][304] ([Intel XE#2136])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][305] ([Intel XE#1430]) -> [SKIP][306] ([Intel XE#2136])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][307] ([Intel XE#2446]) -> [SKIP][308] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][309] ([Intel XE#1489]) -> [SKIP][310] ([Intel XE#2136]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#1489]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][313] ([Intel XE#2387]) -> [SKIP][314] ([Intel XE#2136]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][315] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][316] ([Intel XE#2136]) +13 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_psr@fbc-psr-primary-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][319] ([Intel XE#2234]) -> [SKIP][320] ([Intel XE#2136])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_psr@psr2-primary-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][321] ([Intel XE#2423]) -> [SKIP][322] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][323] ([Intel XE#2330]) -> [SKIP][324] ([Intel XE#2423])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][325] ([Intel XE#2423]) -> [SKIP][326] ([Intel XE#2330])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][327] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][328] ([Intel XE#2423])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][329] ([Intel XE#2423]) -> [SKIP][330] ([Intel XE#2413])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][331] ([Intel XE#2426]) -> [SKIP][332] ([Intel XE#2423])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][333] ([Intel XE#2168]) -> [SKIP][334] ([Intel XE#2423])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_vrr@lobf.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][335] ([Intel XE#2423]) -> [SKIP][336] ([Intel XE#1499]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][337] ([Intel XE#1499]) -> [SKIP][338] ([Intel XE#2423])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          [SKIP][339] ([Intel XE#756]) -> [SKIP][340] ([Intel XE#2423])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][341] ([Intel XE#2504]) -> [SKIP][342] ([Intel XE#1130])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][343] ([Intel XE#3889]) -> [SKIP][344] ([Intel XE#1130])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          [SKIP][345] ([Intel XE#2905]) -> [SKIP][346] ([Intel XE#1130]) +11 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#2905]) +9 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][349] ([Intel XE#2322]) -> [SKIP][350] ([Intel XE#1130]) +10 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#2322]) +7 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][353] ([Intel XE#1192]) -> [SKIP][354] ([Intel XE#2833])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [FAIL][355] ([Intel XE#1999]) -> [SKIP][356] ([Intel XE#1192])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][357] ([Intel XE#586]) -> [SKIP][358] ([Intel XE#1130])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_mmap@small-bar.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][359] ([Intel XE#1130]) -> [SKIP][360] ([Intel XE#2236])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1061]) -> [FAIL][362] ([Intel XE#1173])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_peer2peer@write.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][363] ([Intel XE#1130]) -> [SKIP][364] ([Intel XE#2284])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][365] ([Intel XE#2284]) -> [SKIP][366] ([Intel XE#1130]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][367] ([Intel XE#1130]) -> [SKIP][368] ([Intel XE#944]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][369] ([Intel XE#944]) -> [SKIP][370] ([Intel XE#1130]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88 -> xe-pw-143626v2

  IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88: a15d2a84505eed8dbb58911147e44752734f3a88
  xe-pw-143626v2: 143626v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/index.html

--===============3883204466143656494==
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
<tr><td><b>Series:</b></td><td>drm/i915: Provide more information on display faults (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143626/">https://patchwork.freedesktop.org/series/143626/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88_full -&gt; xe-pw-143626v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143626v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143626v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143626v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@d-hdmi-a1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> +22 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143626v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-8/igt@kms_sequence@get-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-8/igt@kms_sequence@get-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-433/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-432/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_plane_multiple@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_multiple@tiling-none.html">PASS</a> +59 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> +163 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_gt_freq@freq_suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-463/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-dg2-433/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88 -&gt; xe-pw-143626v2</li>
</ul>
<p>IGT_8196: 824553d05138bbfa48b9e60e9c2a741497c7c627 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2504-a15d2a84505eed8dbb58911147e44752734f3a88: a15d2a84505eed8dbb58911147e44752734f3a88<br />
  xe-pw-143626v2: 143626v2</p>

</body>
</html>

--===============3883204466143656494==--
