Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FCBC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 11:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C024010E953;
	Fri, 25 Apr 2025 11:44:08 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480A710E950;
 Fri, 25 Apr 2025 11:44:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6128984728506644415=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Rework/Correction_on_minim?=
 =?utf-8?q?um_hblank_calculation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 11:44:08 -0000
Message-ID: <174558144828.11113.1451210501059729095@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
In-Reply-To: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
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

--===============6128984728506644415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Rework/Correction on minimum hblank calculation (rev6)
URL   : https://patchwork.freedesktop.org/series/147360/
State : failure

== Summary ==

CI Bug Log - changes from xe-2994-6176f71822602f52bc4327965090275c5570ed0d_FULL -> xe-pw-147360v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147360v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147360v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147360v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@degamma@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_color@degamma@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  
New tests
---------

  New tests have been introduced between xe-2994-6176f71822602f52bc4327965090275c5570ed0d_FULL and xe-pw-147360v6_FULL:

### New IGT tests (2) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [18.90] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [18.91] s

  

Known issues
------------

  Here are the changes found in xe-pw-147360v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1465])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2233])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#623])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1466])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4543]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#3884]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#873])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2370])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#316])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2328])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#4543]) +17 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +9 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#610])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2191]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +17 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3432]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +174 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#787]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2907])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2325]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#306]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +10 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#373]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1178]) +2 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2390]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#307])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#307])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#307])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1188]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2320]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2321]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] ([Intel XE#4173]) +4 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2291])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2286])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#323])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1508])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1508])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4354])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4331])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#4331])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4331])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4331])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2244])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4422])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4156])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#776])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2375])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#886])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-433/igt@kms_flip@2x-blocking-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#886]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#2882]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2316]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +5 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#3321]) +5 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2316]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][94] -> [FAIL][95] ([Intel XE#3321])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#301]) +5 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#301])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2:
    - shard-bmg:          [PASS][99] -> [FAIL][100] ([Intel XE#2882]) +4 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [FAIL][102] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2293]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1401]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +22 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#651]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2311]) +27 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4141]) +18 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#656]) +17 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#656]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#651]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2312]) +13 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2313]) +33 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#653]) +23 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#653]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2502])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1503]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_hdr@static-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1503])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1450]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#346])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2925])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2927])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4090])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#4848])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-7efc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2393])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4596])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2763]) +11 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +14 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#870])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2938])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#3309])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2499])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2893])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1489]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4608])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1489]) +12 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1128])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2387])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1122])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#4609])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#3414] / [Intel XE#3904])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2330])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1127])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#3414])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2413])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#1435])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2426])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1500])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][159] -> [FAIL][160] ([Intel XE#4459]) +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2168])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_vrr@lobf.html
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2168])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2168])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1499])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#756])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#756])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#455] / [Intel XE#488])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1126])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4497]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4837]) +15 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4837]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#4837]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@xe_eudebug_online@single-step.html
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#4837]) +14 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4518])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-small:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][175] ([Intel XE#1473] / [Intel XE#3428])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1392]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1392]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][178] -> [SKIP][179] ([Intel XE#1392]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#1392])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2322]) +12 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#288]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][183] ([Intel XE#3428])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_exec_fault_mode@once-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#288]) +15 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2360])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-lnl:          NOTRUN -> [ABORT][186] ([Intel XE#4757])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-bmg:          [PASS][187] -> [DMESG-WARN][188] ([Intel XE#3428])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_gt_freq@freq_fixed_idle.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#4045])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_mmap@pci-membarrier.html
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#4045])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215]) -> ([PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [SKIP][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241]) ([Intel XE#378])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-5/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-adlp:         NOTRUN -> [SKIP][242] ([Intel XE#2541] / [Intel XE#3573])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][245] ([Intel XE#1173])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#2284]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#584])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][248] -> [ABORT][249] ([Intel XE#1794])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_pm@s4-exec-after.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][250] -> [ABORT][251] ([Intel XE#1794])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#579])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#579])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#579])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#579])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#4650])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#4733]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][258] ([Intel XE#4733])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#944])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#944]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][261] ([Intel XE#944])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#944])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#4130])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#4273])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#4351])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#4351])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#4351]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-adlp:         NOTRUN -> [SKIP][268] ([Intel XE#4738])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][269] ([Intel XE#4543]) -> [PASS][270] +3 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-adlp:         [DMESG-WARN][271] ([Intel XE#4173]) -> [PASS][272] +5 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][273] ([Intel XE#4543]) -> [PASS][274] +11 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][275] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][277] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_color@ctm-0-25:
    - shard-bmg:          [DMESG-WARN][279] ([Intel XE#3372] / [Intel XE#3428]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_color@ctm-0-25.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_color@ctm-0-25.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][281] ([Intel XE#2291]) -> [PASS][282] +7 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][283] ([Intel XE#3009]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_dp_aux_dev.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][285] ([Intel XE#2373]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][287] ([Intel XE#301]) -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][289] ([Intel XE#2316]) -> [PASS][290] +11 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][291] ([Intel XE#3428]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][293] ([Intel XE#301]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][295] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [INCOMPLETE][297] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][299] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][300] +3 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][301] ([Intel XE#886]) -> [PASS][302] +4 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][303] ([Intel XE#1503]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][305] ([Intel XE#4596]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1392]) -> [PASS][308] +8 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][309] ([Intel XE#1794]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][311] ([Intel XE#4835]) -> [PASS][312] +1 other test pass
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][313] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][314] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][315] ([Intel XE#3124]) -> [INCOMPLETE][316] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][317] ([Intel XE#1178]) -> [SKIP][318] ([Intel XE#2341])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_content_protection@srm.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][319] ([Intel XE#2316]) -> [FAIL][320] ([Intel XE#3321])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][321] ([Intel XE#2311]) -> [SKIP][322] ([Intel XE#2312]) +11 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#2311]) +22 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][325] ([Intel XE#2312]) -> [SKIP][326] ([Intel XE#4141]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][327] ([Intel XE#4141]) -> [SKIP][328] ([Intel XE#2312]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][329] ([Intel XE#2313]) -> [SKIP][330] ([Intel XE#2312]) +9 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][331] ([Intel XE#2312]) -> [SKIP][332] ([Intel XE#2313]) +18 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][333] ([Intel XE#1729]) -> [SKIP][334] ([Intel XE#2426])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-dg2-set2:     [INCOMPLETE][335] -> [SKIP][336] ([Intel XE#1392])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [DMESG-WARN][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [DMESG-WARN][357], [DMESG-WARN][358], [PASS][359], [PASS][360], [PASS][361]) ([Intel XE#3428]) -> ([PASS][362], [PASS][363], [PASS][364], [SKIP][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387]) ([Intel XE#2457])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1061]) -> [FAIL][389] ([Intel XE#1173])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_peer2peer@read.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
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
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3372
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4738]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4738
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4848
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8335 -> IGT_8336
  * Linux: xe-2994-6176f71822602f52bc4327965090275c5570ed0d -> xe-pw-147360v6

  IGT_8335: 8335
  IGT_8336: 8336
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc4327965090275c5570ed0d
  xe-pw-147360v6: 147360v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/index.html

--===============6128984728506644415==
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
<tr><td><b>Series:</b></td><td>Rework/Correction on minimum hblank calculat=
ion (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147360/">https://patchwork.freedesktop.org/series/147360/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147360v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147360v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2994-6176f71822602f52bc4327965090275c5=
570ed0d_FULL -&gt; xe-pw-147360v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147360v6_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147360v6_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1473=
60v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_color@degamma@pipe-a-dp-2=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-dp2-hdmi-a3.html">=
FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2994-6176f71822602f52bc4327965=
090275c5570ed0d_FULL and xe-pw-147360v6_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-c-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [18.91] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147360v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#146=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_async=
_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +17 other tests dmesg-fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-a=
fter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-w=
ithout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-wit=
hout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_c=
ursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@kms_flip@2x-blocking-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</l=
i>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-1/igt@kms_flip@2x-blocking-absolut=
e-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-433/igt@kms_fl=
ip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_flip@2x-blocki=
ng-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vbl=
ank@ab-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6=
/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-=
hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip@flip-vs-expi=
red-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_flip=
@modeset-vs-vblank-race-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@k=
ms_flip@modeset-vs-vblank-race-interruptible@b-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#310=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683=
">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests s=
kip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@kms_joiner@invalid-modeset-=
force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_plan=
e_alpha_blend@alpha-7efc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_plane_alpha_blen=
d@alpha-7efc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4848">Intel XE#4848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_psr@psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_writeback@writeback-pix=
el-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4497">Intel XE#4497</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_evict@evict-small.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@xe_exec_fault_mode@many-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_exec_fault_mode@once-userp=
tr-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-464/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_add_hw_engine_class_defaults.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@xe_gt_fr=
eq@freq_fixed_idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_gt_freq@freq_fixed_idle=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/40=
45">Intel XE#4045</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-3/igt@xe_mmap@pci-membarrier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570=
ed0d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c=
5570ed0d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090=
275c5570ed0d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc432796=
5090275c5570ed0d/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc43=
27965090275c5570ed0d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52=
bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f7182260=
2f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f718=
22602f52bc4327965090275c5570ed0d/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176=
f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-=
6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147360v6/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147360v6/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-4/igt@xe_oa@invalid-oa-metric-set-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-1/igt@xe_pm@s4=
-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147360v6/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147360v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_pmu@fn-engine-activity-s=
ched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_pxp@regular-src-to-pxp-d=
est-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-434/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-5/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-9/igt@xe_query@multigpu-query-inva=
lid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-dg2-435/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-lnl-3/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4351">Intel XE#4351</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147360v6/shard-adlp-6/igt@xe_sriov_scheduling@nonpreem=
pt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4738">Intel XE#4738</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6=
/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47360v6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-a=
tomic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
360v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-432/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_colo=
r@ctm-0-25.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3372">Intel XE#3372</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/ig=
t@kms_color@ctm-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147360v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard=
-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip=
@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/=
igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shar=
d-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
360v6/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6=
/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-4/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shar=
d-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS=
</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-4=
33/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +8 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-lnl-2/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147360v6/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4835">Intel XE#4835</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-463/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47360v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d=
-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147360v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147360v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v=
6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
360v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1473=
60v6/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr.html">INCOMPLETE</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg=
2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570=
ed0d/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c=
5570ed0d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090=
275c5570ed0d/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc432796=
5090275c5570ed0d/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc43=
27965090275c5570ed0d/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52=
bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f7=
1822602f52bc4327965090275c5570ed0d/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-61=
76f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-299=
4-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-bmg-6/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/sh=
ard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965090275c5=
570ed0d/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc43279650902=
75c5570ed0d/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2994-6176f71822602f52bc4327965=
090275c5570ed0d/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#342=
8</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147360v6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147360v6/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147360v6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147360v6/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7360v6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2994-6176f71822602f52bc4327965090275c5570ed0d/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147360v6/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8335 -&gt; IGT_8336</li>
<li>Linux: xe-2994-6176f71822602f52bc4327965090275c5570ed0d -&gt; xe-pw-147=
360v6</li>
</ul>
<p>IGT_8335: 8335<br />
  IGT_8336: 8336<br />
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc43279=
65090275c5570ed0d<br />
  xe-pw-147360v6: 147360v6</p>

</body>
</html>

--===============6128984728506644415==--
