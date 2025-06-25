Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48182C7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 11:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC42610E216;
	Wed, 25 Jun 2025 11:11:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEDD10E20A;
 Wed, 25 Jun 2025 11:11:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4979287528386157340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Use_st?=
 =?utf-8?q?atic_values_for_min=5Fhblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 11:11:39 -0000
Message-ID: <175084989929.107859.10928644102386919822@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624-min_hblank-v2-1-9110a9342d8c@intel.com>
In-Reply-To: <20250624-min_hblank-v2-1-9110a9342d8c@intel.com>
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

--===============4979287528386157340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Use static values for min_hblank
URL   : https://patchwork.freedesktop.org/series/150683/
State : failure

== Summary ==

CI Bug Log - changes from xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201_FULL -> xe-pw-150683v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150683v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150683v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150683v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-dp4.html

  
New tests
---------

  New tests have been introduced between xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201_FULL and xe-pw-150683v1_FULL:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  

Known issues
------------

  Here are the changes found in xe-pw-150683v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#4427]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911]) +7 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#3767]) +31 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#3884]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4543]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2328])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#619])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1467])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#4543]) +10 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +209 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#2705] / [Intel XE#4212])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +42 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2724])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4417]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4417]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#306]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#306]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2252]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2341])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1178]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#307]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#307]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#307])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2390]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1188]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2321])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1424]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2320]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2291]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#323])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#3009])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#4422])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4422])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4422])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4422])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#776])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#776])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2373])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +12 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#301]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2316]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#310])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1421]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#3098]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#301]) +3 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][83] -> [DMESG-WARN][84] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#886]) +4 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +12 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2293] / [Intel XE#2380])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][93] -> [DMESG-FAIL][94] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][96] -> [FAIL][97] ([Intel XE#1874])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#656]) +15 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4141]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2311]) +10 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#651]) +26 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#651]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2313]) +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#656]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#653]) +20 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#653])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#3374] / [Intel XE#3544])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#3374] / [Intel XE#3544])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#455])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#1503]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#346])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2501])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#356])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4329])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4359])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#4596])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#5020])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#870])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#908]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#718]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1439] / [Intel XE#3141])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#836])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893] / [Intel XE#4608])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4608]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2893])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1489]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1489])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1489]) +8 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1406])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4609])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][138] ([Intel XE#4689])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1127])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2330])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1127])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][142] -> [FAIL][143] ([Intel XE#2883]) +2 other tests fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][144] -> [SKIP][145] ([Intel XE#1435])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2426])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][147] ([Intel XE#1729])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#362])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#1499])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1091] / [Intel XE#2849])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1091] / [Intel XE#2849])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#1091] / [Intel XE#2849])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1123])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1123])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#5308])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_eu_stall@blocking-read.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#5308])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#4837]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4837]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#4837]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#688])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1392])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1392]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][163] -> [SKIP][164] ([Intel XE#1392]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1392])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2322]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#288]) +26 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#288]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#2360])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][170] -> [DMESG-WARN][171] ([Intel XE#4812])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][172] -> [DMESG-WARN][173] ([Intel XE#3876])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4837]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#4943]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4915]) +233 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#4915]) +23 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#4943]) +14 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-mmap-huge.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#5100])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#512])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][181] -> [ABORT][182] ([Intel XE#5087])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#2541] / [Intel XE#3573])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2838] / [Intel XE#979])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2284] / [Intel XE#366])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#584]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][188] -> [FAIL][189] ([Intel XE#5166]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@xe_pmu@gt-frequency.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#4733]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#4733])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#4733]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#944])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#944])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#4814])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#4130])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#4130])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#4351])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [SKIP][199] ([Intel XE#4947]) -> [PASS][200] +2 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#4543]) -> [PASS][204] +3 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][205] ([Intel XE#3862]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][207] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][209] ([Intel XE#2291]) -> [PASS][210] +4 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][211] ([Intel XE#2316]) -> [PASS][212] +3 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][213] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][215] ([Intel XE#301]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][220] +5 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][221] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][222] +3 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][223] ([Intel XE#1503]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_hdr@static-swap.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][225] ([Intel XE#3012]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][227] ([Intel XE#616]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-dg2-set2:     [INCOMPLETE][229] -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-432/igt@kms_plane_multiple@tiling-none.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][231] ([Intel XE#2571]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-adlp:         [SKIP][233] ([Intel XE#4950]) -> [PASS][234] +9 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][235] ([Intel XE#718]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [SKIP][237] ([Intel XE#4962]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_prop_blob@invalid-set-prop-any:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208] / [i915#2575]) -> [PASS][240] +4 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_prop_blob@invalid-set-prop-any.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_prop_blob@invalid-set-prop-any.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][241] ([Intel XE#4459]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][243] ([Intel XE#4227]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-2/igt@kms_vrr@max-min.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_vrr@max-min.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1392]) -> [PASS][246] +5 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@once-basic:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [PASS][248] +5 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exec_compute_mode@once-basic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_exec_compute_mode@once-basic.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][249] ([Intel XE#5018]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-bal-rebind:
    - shard-adlp:         [SKIP][251] ([Intel XE#4945]) -> [PASS][252] +10 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec_threads@threads-bal-rebind.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_exec_threads@threads-bal-rebind.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [FAIL][253] ([Intel XE#3099]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][255] ([Intel XE#4947]) -> [SKIP][256] ([Intel XE#1124]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4208]) -> [SKIP][258] ([Intel XE#316])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-adlp:         [SKIP][259] ([Intel XE#4947]) -> [SKIP][260] ([Intel XE#316])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [SKIP][261] ([Intel XE#4947]) -> [DMESG-FAIL][262] ([Intel XE#4543])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208]) -> [SKIP][264] ([Intel XE#1124])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][265] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-FAIL][266] ([Intel XE#4543])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         [SKIP][267] ([Intel XE#4950]) -> [SKIP][268] ([Intel XE#367])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][269] ([Intel XE#4947]) -> [SKIP][270] ([Intel XE#455] / [Intel XE#787])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][271] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][272] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][273] ([Intel XE#3124]) -> [INCOMPLETE][274] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         [SKIP][275] ([Intel XE#4950]) -> [SKIP][276] ([Intel XE#306])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         [SKIP][277] ([Intel XE#4950]) -> [SKIP][278] ([Intel XE#309]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         [SKIP][279] ([Intel XE#4947]) -> [SKIP][280] ([Intel XE#776])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fbcon_fbt@psr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#776])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fbcon_fbt@psr.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         [SKIP][283] ([Intel XE#4950]) -> [SKIP][284] ([Intel XE#310])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][285] ([Intel XE#4947]) -> [SKIP][286] ([Intel XE#651]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208]) -> [SKIP][288] ([Intel XE#651]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][289] ([Intel XE#2311]) -> [SKIP][290] ([Intel XE#2312]) +15 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][291] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][292] ([Intel XE#656])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][294] ([Intel XE#651])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#2311]) +20 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][297] ([Intel XE#2312]) -> [SKIP][298] ([Intel XE#4141]) +8 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][299] ([Intel XE#4947]) -> [SKIP][300] ([Intel XE#656]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][301] ([Intel XE#4141]) -> [SKIP][302] ([Intel XE#2312]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][303] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][304] ([Intel XE#651])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208]) -> [SKIP][306] ([Intel XE#653])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#2312]) +18 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#2313]) +15 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][311] ([Intel XE#4947]) -> [SKIP][312] ([Intel XE#653]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][314] ([Intel XE#653])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208] / [i915#2575]) -> [SKIP][316] ([Intel XE#455]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         [SKIP][317] ([Intel XE#4947]) -> [SKIP][318] ([Intel XE#1489])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_vrr@flip-basic:
    - shard-adlp:         [SKIP][319] ([Intel XE#4950]) -> [SKIP][320] ([Intel XE#455]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_vrr@flip-basic.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@kms_vrr@flip-basic.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#1126])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
    - shard-adlp:         [SKIP][323] ([Intel XE#4945]) -> [SKIP][324] ([Intel XE#1126])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-adlp:         [SKIP][325] ([Intel XE#4945]) -> [SKIP][326] ([Intel XE#4837])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_eudebug_online@interrupt-reconnect.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_eudebug_online@interrupt-reconnect.html
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#4837])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_eudebug_online@interrupt-reconnect.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][329] ([Intel XE#4945]) -> [SKIP][330] ([Intel XE#1392])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         [SKIP][331] ([Intel XE#4945]) -> [SKIP][332] ([Intel XE#288]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208]) -> [SKIP][334] ([Intel XE#288])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [SKIP][335] ([Intel XE#4945]) -> [DMESG-FAIL][336] ([Intel XE#3868])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:
    - shard-adlp:         [SKIP][337] ([Intel XE#4945]) -> [SKIP][338] ([Intel XE#4915]) +33 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#4915]) +16 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][341] ([Intel XE#5018]) -> [FAIL][342] ([Intel XE#4937])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         [SKIP][343] ([Intel XE#4945]) -> [SKIP][344] ([Intel XE#2541] / [Intel XE#3573])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_oa@invalid-create-userspace-config.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_oa@invalid-create-userspace-config.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8423 -> IGT_8424
  * Linux: xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201 -> xe-pw-150683v1

  IGT_8423: 8423
  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201: fb5dada21e3cfa26179ca58e1d7c26cdad217201
  xe-pw-150683v1: 150683v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/index.html

--===============4979287528386157340==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Use static values for min_=
hblank</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150683/">https://patchwork.freedesktop.org/series/150683/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150683v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150683v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3297-fb5dada21e3cfa26179ca58e1d7c26cda=
d217201_FULL -&gt; xe-pw-150683v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150683v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150683v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1506=
83v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-dp4:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_fl=
ip@blocking-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-=
435/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-dp4.html">FAIL=
</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3297-fb5dada21e3cfa26179ca58e1=
d7c26cdad217201_FULL and xe-pw-150683v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-dp-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150683v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435=
/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427">Intel =
XE#4427</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0683v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@=
kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/sha=
rd-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip=
</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +209 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@kms_chamelium_color@gamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-w=
ith-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other=
 tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Inte=
l XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblan=
k-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_flip@2x-plain-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
21">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-434/igt@kms_fl=
ip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/=
igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE=
#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@kms_flip@flip-vs-s=
uspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-8/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/ig=
t@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150683v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-4/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150683v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-rend=
er@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-7/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-2/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-3/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_eu_stall@blocking-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5308">Intel XE#5308</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5308">Intel XE#5308</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@xe_eudebug@discovery-race-vm=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-1/igt@xe_evict@evict-small-multi-vm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-ex=
ec-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@xe_exec_fault_mode@many-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_exec_fault_mode@once-inva=
lid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-9/igt@xe_exec_reset@gt-rese=
t-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4812">Intel XE#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-434/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@xe_exec_sip_eudebug@wait-wr=
itesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-many-large-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-mlock.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +233 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#49=
15</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-6/igt@xe_exec_system_allocator@twic=
e-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4943">Intel XE#4943</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-3/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests=
 skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-6/igt@xe_oa@whitelisted-registers-=
userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-5/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/584">Intel XE#584</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166"=
>Intel XE#5166</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-434/igt@xe_query@multigpu-query-inv=
alid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@xe_render_copy@render-stres=
s-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_=
big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0683v1/shard-dg2-435/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
683v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150683v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150683v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-463=
/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-=
5/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1506=
83v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_hdr@static-swap=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-8/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-463/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-=
dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-432/igt@kms_pl=
ane_multiple@tiling-none.html">INCOMPLETE</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_plane_mu=
ltiple@tiling-none.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-bmg-1/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_pla=
ne_scaling@plane-scaler-unity-scaling-with-rotation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1506=
83v1/shard-adlp-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rot=
ation.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-8/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_pm_=
rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@kms_pm=
_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_pr=
op_blob@invalid-set-prop-any.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shar=
d-dg2-432/igt@kms_prop_blob@invalid-set-prop-any.html">PASS</a> +4 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-2/igt@kms_vrr@=
max-min.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150683v1/shard-lnl-6/igt@kms_vrr@max-min.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150683v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-bindexecqueue-userptr.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exe=
c_compute_mode@once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@xe_=
exec_compute_mode@once-basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150683v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec=
_threads@threads-bal-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe=
_exec_threads@threads-bal-rebind.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_live=
_ktest@xe_dma_buf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_live_ktes=
t@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big=
_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms=
_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_bi=
g_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-432/igt@=
kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big=
_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-8/igt@km=
s_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_big=
_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/igt@km=
s_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@=
kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"=
>Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw=
-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_bw@=
connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/s=
hard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
7">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_ccs=
@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shar=
d-adlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50683v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a=
-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#42=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/452=
2">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_cha=
melium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_cur=
sor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-=
adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel X=
E#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fbc=
on_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-2/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-464/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fli=
p@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/i=
gt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150683v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150683v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1506=
83v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150683v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1506=
83v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150683v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50683v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
683v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
683v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/sh=
ard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
>Intel XE#653</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150683v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaled=
primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@kms_hd=
r@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-4=
34/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_psr=
2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50683v1/shard-adlp-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@kms_vrr=
@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@kms_vrr@flip-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_copy=
_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-4/igt@x=
e_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_eude=
bug_online@interrupt-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-1/i=
gt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_eud=
ebug_online@interrupt-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-dg2-435/=
igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150683v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-=
vm-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150683v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-binde=
xecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test sk=
ip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150683v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bin=
dexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec=
_reset@cm-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/igt@xe_exec_re=
set@cm-cat-error.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_exec=
_system_allocator@many-large-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel X=
E#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150683v1/shard-adlp-8/igt@xe_exec_system_allocator@many-large-mmap-remap-=
dontunmap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-new-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1506=
83v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-new-race-nomem=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4915">Intel XE#4915</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150683v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201/shard-adlp-4/igt@xe_oa@i=
nvalid-create-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150683v1/shard-adlp-3/i=
gt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3=
573</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8423 -&gt; IGT_8424</li>
<li>Linux: xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201 -&gt; xe-pw-150=
683v1</li>
</ul>
<p>IGT_8423: 8423<br />
  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3297-fb5dada21e3cfa26179ca58e1d7c26cdad217201: fb5dada21e3cfa26179ca58=
e1d7c26cdad217201<br />
  xe-pw-150683v1: 150683v1</p>

</body>
</html>

--===============4979287528386157340==--
