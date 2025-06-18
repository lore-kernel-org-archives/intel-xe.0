Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1481EC71136
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 02:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5F10E0B4;
	Wed, 18 Jun 2025 02:02:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1FA10E0B4;
 Wed, 18 Jun 2025 02:02:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1570065923114854034=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe=3A_Move_DSB_l2_flush_to_a_more_sensible_place_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 02:02:31 -0000
Message-ID: <175021215156.89558.2248277872730658326@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606104546.1996818-3-matthew.auld@intel.com>
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
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

--===============1570065923114854034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Move DSB l2 flush to a more sensible place (rev2)
URL   : https://patchwork.freedesktop.org/series/149935/
State : failure

== Summary ==

CI Bug Log - changes from xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1_FULL -> xe-pw-149935v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149935v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149935v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149935v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@engine-activity-single-load:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pmu@engine-activity-single-load.html

  
Known issues
------------

  Here are the changes found in xe-pw-149935v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#1125]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#623])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][4] ([Intel XE#4543]) +2 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#3908]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#607])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124]) +20 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#316]) +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#4543]) +4 other tests dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#4543])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][15] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#619])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#610]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#2191]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#367]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +61 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#3862]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#3442])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +92 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +97 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#2907]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#373]) +19 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#306]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2325])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#307]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#455]) +47 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#1178])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#308]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#309]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#323])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#3009])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_dp_aux_dev.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#4354])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4354])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2244])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#776])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#776])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1135]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2316]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301]) +5 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#310]) +14 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         NOTRUN -> [FAIL][75] ([Intel XE#2882]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [FAIL][76] ([Intel XE#886])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [PASS][77] -> [FAIL][78] ([Intel XE#886]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#886]) +4 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2882]) +4 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#651]) +35 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#651])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#656]) +89 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4141]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1151])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +32 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2311]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2313]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#653]) +28 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1158])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#653]) +31 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1339])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#3012])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#2925])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2925]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#346])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2927])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#356])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][102] ([Intel XE#5195]) +4 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#616]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#4596])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4596])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#4596]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#5021])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#5020])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#5020])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1129]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#3309])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#3309])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1489]) +15 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2893])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1489]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1122]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1122]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2850] / [Intel XE#929]) +32 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2414])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][127] ([Intel XE#1874])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1127]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#3414]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][131] -> [SKIP][132] ([Intel XE#1435])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1500])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#330])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#455]) +23 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2168]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][137] -> [SKIP][138] ([Intel XE#1499])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#455] / [Intel XE#488]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#3576])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1126]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#944]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#4497]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_eu_stall@blocking-re-enable.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4497])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4837])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#4837]) +32 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#4519])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#261] / [Intel XE#688]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#688]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1392])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1392]) +20 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#288]) +49 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#288]) +27 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2360])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2360])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][157] ([Intel XE#3868])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4837]) +14 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#4943])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#4943]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#4915]) +520 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#4915]) +278 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][163] -> [DMESG-WARN][164] ([Intel XE#3876])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#560])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#5100])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#378])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191]) -> ([PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [SKIP][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217]) ([Intel XE#2457])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#4501])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-adlp:         NOTRUN -> [SKIP][220] ([Intel XE#5103])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2838] / [Intel XE#979])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#979])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#979])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#2284] / [Intel XE#366])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][229] -> [ABORT][230] ([Intel XE#1794])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#579])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#579])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#4650])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_decode1:
    - shard-adlp:         NOTRUN -> [FAIL][234] ([Intel XE#5178])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_decode1.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#4733]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#4733]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#4733])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#944])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#944]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#4814])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#4814])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#4130])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][243] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][247] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][249] ([Intel XE#3124]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][251] ([Intel XE#2291]) -> [PASS][252] +3 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][253] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][254] +5 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][255] ([Intel XE#301]) -> [PASS][256] +6 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][257] ([Intel XE#2316]) -> [PASS][258] +11 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][259] ([Intel XE#3098]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][261] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][262] +3 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][263] ([Intel XE#4596]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][265] ([Intel XE#4459]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][267] ([Intel XE#1794]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-2/igt@xe_pm@s4-basic.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_pm@s4-basic.html

  * igt@xe_pmu@engine-activity-load:
    - shard-adlp:         [ABORT][269] ([Intel XE#5214]) -> [PASS][270] +25 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-8/igt@xe_pmu@engine-activity-load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@xe_pmu@engine-activity-load.html

  * {igt@xe_pmu@engine-activity-render-node-idle}:
    - shard-adlp:         [DMESG-WARN][271] ([Intel XE#5214]) -> [PASS][272] +2 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-9/igt@xe_pmu@engine-activity-render-node-idle.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@xe_pmu@engine-activity-render-node-idle.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][273] ([Intel XE#5166]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-436/igt@xe_pmu@gt-frequency.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [DMESG-FAIL][275] ([Intel XE#5237]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-bmg:          [FAIL][277] -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_vm@bind-array-enobufs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][279] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][280] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][281] ([Intel XE#1178]) -> [SKIP][282] ([Intel XE#2341])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][283] ([Intel XE#2341]) -> [FAIL][284] ([Intel XE#1178])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_content_protection@srm.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#2312]) +15 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][287] ([Intel XE#2312]) -> [SKIP][288] ([Intel XE#2311]) +14 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][289] ([Intel XE#2312]) -> [SKIP][290] ([Intel XE#4141]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][291] ([Intel XE#4141]) -> [SKIP][292] ([Intel XE#2312]) +10 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][293] ([Intel XE#2313]) -> [SKIP][294] ([Intel XE#2312]) +13 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#2313]) +16 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@xe_pmu@engine-activity-single-load:
    - shard-adlp:         [ABORT][297] ([Intel XE#5214]) -> [FAIL][298] ([Intel XE#5178])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-3/igt@xe_pmu@engine-activity-single-load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_pmu@engine-activity-single-load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5178
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
  [Intel XE#5237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5237
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1 -> xe-pw-149935v2

  IGT_8413: 8413
  xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1: bd41471dab0093a7057a9a9888337d916145bbb1
  xe-pw-149935v2: 149935v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/index.html

--===============1570065923114854034==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Move DSB =
l2 flush to a more sensible place (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149935/">https://patchwork.freedesktop.org/series/149935/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149935v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149935v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3263-bd41471dab0093a7057a9a9888337d916=
145bbb1_FULL -&gt; xe-pw-149935v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149935v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149935v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1499=
35v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@engine-activity-single-load:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pmu@engine-activity-sing=
le-load.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149935v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_async_flips@async-flip-s=
uspend-resume.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-1/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +20 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adl=
p-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rot=
ate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +61 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +92 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg=
2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#=
4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_chamelium_audio@hdmi-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_cursor_crc@cursor-slidi=
ng-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired=
-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_flip@plain-flip-fb-recre=
ate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@kms_flip@plain-flip-fb-recre=
ate@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_flip@plain-flip-ts=
-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-1/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-5/igt@kms_=
flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@k=
ms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +35 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +89 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +32 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +31 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_getfb@getfb2-accept-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_joiner@basic-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@kms_plane@pixel-format@pipe-=
b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-466/igt@=
kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_plane_multiple@2x-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +15 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-=
rotation-cropping-top.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_ccs@block-multicopy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/488">Intel XE#488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_eu_stall@blocking-re-enab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4497">Intel XE#4497</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_eu_stall@blocking-re-ena=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_eudebug_sriov@deny-eudebu=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +20 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +49 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_sip_eudebug@wait-wr=
itesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_exec_system_allocator@pro=
cesses-evict-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +520 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +278 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-466/=
igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Inte=
l XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_mmap@pci-membarrier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145=
bbb1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d91=
6145bbb1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a988833=
7d916145bbb1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a98=
88337d916145bbb1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a=
9a9888337d916145bbb1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab0093a7=
057a9a9888337d916145bbb1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471dab00=
93a7057a9a9888337d916145bbb1/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41471d=
ab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-bd41=
471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3263-=
bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149935v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149935v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149935v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149935v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-3/igt@xe_oa@buffer-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">=
Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_oa@mmio-triggered-reports=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5103">Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_oa@non-privileged-map-oa=
-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-4/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_video_=
decode1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@xe_pmu@engine-activity-singl=
e-load@engine-drm_xe_engine_class_video_decode1.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5178">Intel XE#5178</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4733">Intel XE#4733</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-adlp-4/igt@xe_render_copy@render-stress=
-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149935v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@=
selfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149935v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-mc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel =
XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149935v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pi=
pe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149935v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-1/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-7/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2=
/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-4/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-3/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-3/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149935v2/shard-lnl-8/igt@xe_pm@s4-basic.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-8/igt@xe_pmu@=
engine-activity-load.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-6/igt@xe_pmu@e=
ngine-activity-load.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@engine-activity-render-node-idle}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-9/igt@xe_pmu@=
engine-activity-render-node-idle.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-ad=
lp-9/igt@xe_pmu@engine-activity-render-node-idle.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-436/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-464/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-4/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5237">Intel X=
E#5237</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149935v2/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@nu=
mvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@xe_vm@bi=
nd-array-enobufs.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@xe_vm@bind-array-enobufs.htm=
l">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149935v2/shard-dg2-435/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-bmg-1/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1499=
35v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1499=
35v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149935v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v=
2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
935v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9935v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1/shard-adlp-3/igt@xe_pmu@=
engine-activity-single-load.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v2/shard-adlp-1/igt@x=
e_pmu@engine-activity-single-load.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5178">Intel XE#5178</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1 -&gt; xe-pw-149=
935v2</li>
</ul>
<p>IGT_8413: 8413<br />
  xe-3263-bd41471dab0093a7057a9a9888337d916145bbb1: bd41471dab0093a7057a9a9=
888337d916145bbb1<br />
  xe-pw-149935v2: 149935v2</p>

</body>
</html>

--===============1570065923114854034==--
