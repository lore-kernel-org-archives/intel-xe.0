Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B59BC5B549
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 08:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99D10E982;
	Fri,  6 Jun 2025 08:21:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7510E379;
 Fri,  6 Jun 2025 08:20:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7651933977040624153=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PF=3A_Print_debug_stuff_us?=
 =?utf-8?q?ing_debug_printer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 08:20:59 -0000
Message-ID: <174919805975.55121.670858042305993734@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604190021.725-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250604190021.725-1-michal.wajdeczko@intel.com>
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

--===============7651933977040624153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Print debug stuff using debug printer
URL   : https://patchwork.freedesktop.org/series/149849/
State : failure

== Summary ==

CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_FULL -> xe-pw-149849v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149849v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149849v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149849v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][1] -> ([PASS][2], [DMESG-WARN][3])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  
Known issues
------------

  Here are the changes found in xe-pw-149849v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#3767]) +15 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#873])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> ([SKIP][6], [SKIP][7]) ([Intel XE#664])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_async_flips@test-cursor.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#619])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][9], [SKIP][10]) ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> ([SKIP][13], [SKIP][14]) ([Intel XE#316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][15], [SKIP][16]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][18] -> ([DMESG-FAIL][19], [PASS][20]) ([Intel XE#4543]) +1 other test ( 1 dmesg-fail, 1 pass )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#1512])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#2887]) +4 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2907])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#2887])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +17 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][37] -> ([INCOMPLETE][38], [PASS][39]) ([Intel XE#3862]) +1 other test ( 1 incomplete, 1 pass )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#3442])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#3432])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +174 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#787]) +34 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][49] ([Intel XE#3113])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][51] -> ([INCOMPLETE][52], [PASS][53]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#2652] / [Intel XE#787]) +11 other tests ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#455] / [Intel XE#787]) +4 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2724])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4417]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#4416]) +3 other tests ( 2 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#373]) +5 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_chamelium_audio@dp-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#306])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2252]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#373]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#373]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#307])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#307])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2341])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1178]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#5176])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_content_protection@lic-type-0.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#1178]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][76], [FAIL][77]) ([Intel XE#1188])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#2321]) +1 other test ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#309])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#309])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#2291]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2291])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][86] -> ([PASS][87], [SKIP][88]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4494])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#4356])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][91] -> ([PASS][92], [SKIP][93]) ([Intel XE#4294])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#2244])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#4422])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4422])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4422])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#702])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_feature_discovery@display-2x.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1135])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [PASS][102] -> ([PASS][103], [SKIP][104]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#1421]) +1 other test ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#310]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#2316]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][110] -> ([FAIL][111], [PASS][112]) ([Intel XE#301])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][113] -> ([PASS][114], [FAIL][115]) ([Intel XE#301] / [Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][116], [PASS][117]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2316]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][119] -> ([SKIP][120], [SKIP][121]) ([Intel XE#2316]) +3 other tests ( 2 skip )
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][122] -> [FAIL][123] ([Intel XE#301])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> ([FAIL][124], [FAIL][125]) ([Intel XE#301]) +1 other test ( 2 fail )
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> ([FAIL][126], [FAIL][127]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 2 fail )
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][128] -> ([DMESG-WARN][129], [PASS][130]) ([Intel XE#2953] / [Intel XE#4173]) +1 other test ( 1 dmesg-warn, 1 pass )
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2293] / [Intel XE#2380])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2293])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][137] -> ([FAIL][138], [PASS][139]) ([Intel XE#1874])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#651]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#651]) +11 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#651])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#656]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][147], [SKIP][148]) ([Intel XE#656]) +12 other tests ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2311]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4141]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#653]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2312]) +8 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#653])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#653]) +7 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#656])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2313]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][159] -> ([PASS][160], [SKIP][161]) ([Intel XE#1503])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_hdr@static-swap.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_hdr@static-swap.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2927])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2501])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#356])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4359])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#599]) +3 other tests ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_lowres@tiling-4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][168] -> ([SKIP][169], [PASS][170]) ([Intel XE#4596]) +1 other test ( 1 pass, 1 skip )
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][171] -> [SKIP][172] ([Intel XE#4596])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#5020])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][175] -> ([PASS][176], [SKIP][177]) ([Intel XE#2571])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2763]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#870])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#1122])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#2893] / [Intel XE#4608])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][185], [SKIP][186]) ([Intel XE#4608]) +1 other test ( 2 skip )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#1489]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#1489])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#1489]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#2893]) +2 other tests ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#1489])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#1122])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#4609]) +1 other test ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#1406]) +3 other tests ( 2 skip )
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr@pr-basic.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1127])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> ([SKIP][203], [SKIP][204]) ([Intel XE#3414] / [Intel XE#3904])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#3414])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][206] ([Intel XE#2883]) +3 other tests fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#2426])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#362])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#1499])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][212] -> ([FAIL][213], [PASS][214]) ([Intel XE#4227]) +1 other test ( 1 fail, 1 pass )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@kms_vrr@flipline.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_vrr@flipline.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#455]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_vrr@negative-basic.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#1091] / [Intel XE#2849])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#455]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#4497]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#4837]) +7 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-adlp:         NOTRUN -> [SKIP][220] ([Intel XE#4837]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#4837]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> ([SKIP][222], [SKIP][223]) ([Intel XE#4837]) +3 other tests ( 2 skip )
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#688]) +1 other test ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_evict@evict-beng-large-multi-vm.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#688])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#1392]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-adlp:         NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#1392])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#1392]) +2 other tests ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#2322])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#2322])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][235] -> ([PASS][236], [SKIP][237]) ([Intel XE#1392]) +7 other tests ( 1 pass, 1 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#288]) +8 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][239] ([Intel XE#288]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][240] -> ([DMESG-WARN][241], [PASS][242]) ([Intel XE#3876])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:
    - shard-bmg:          [PASS][243] -> [DMESG-WARN][244] ([Intel XE#3428])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-4/igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - shard-lnl:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#4943]) +8 other tests ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#4943])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#4915]) +5 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@xe_exec_system_allocator@many-large-mmap-remap-ro.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][251] ([Intel XE#4915]) +59 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#4915]) +103 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#4943]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][254] -> ([FAIL][255], [PASS][256]) ([Intel XE#5018]) +1 other test ( 1 fail, 1 pass )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-lnl:          [PASS][257] -> ([PASS][258], [DMESG-WARN][259]) ([Intel XE#3876])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#512])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_mmap@small-bar.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#378])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_module_load@force-load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_module_load@force-load.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][265] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][266] ([Intel XE#2245])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#979])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#1948])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][270] -> ([PASS][271], [ABORT][272]) ([Intel XE#1794])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][273] -> ([PASS][274], [ABORT][275]) ([Intel XE#1794])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#4733])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-adlp:         NOTRUN -> [SKIP][277] ([Intel XE#4814])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#4351])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][280] ([Intel XE#3428]) -> ([PASS][281], [PASS][282]) +7 other tests ( 2 pass )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#4543]) -> ([PASS][284], [PASS][285]) +1 other test ( 2 pass )
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [DMESG-FAIL][286] -> ([PASS][287], [PASS][288])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][289] -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][291] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][292], [PASS][293])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][294] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][296] ([Intel XE#3124] / [Intel XE#4345]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][298] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][300] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][302] ([Intel XE#3113]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][304] ([Intel XE#2291]) -> ([PASS][305], [PASS][306]) +6 other tests ( 2 pass )
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][307] ([Intel XE#2882]) -> [PASS][308] +4 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ad-dp2-hdmi-a3.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][309] ([Intel XE#2316]) -> ([PASS][310], [PASS][311]) +7 other tests ( 2 pass )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][312] ([Intel XE#301]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][314] ([Intel XE#3149] / [Intel XE#886]) -> ([PASS][315], [PASS][316])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][317] ([Intel XE#886]) -> ([PASS][318], [PASS][319]) +2 other tests ( 2 pass )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][320] ([Intel XE#4543]) -> ([PASS][321], [PASS][322])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][323] ([Intel XE#1503]) -> ([PASS][324], [PASS][325])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][326] ([Intel XE#3012]) -> ([PASS][327], [PASS][328])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][329] ([Intel XE#2953]) -> ([PASS][330], [PASS][331]) +1 other test ( 2 pass )
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html

  * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][332] ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][333], [PASS][334]) +2 other tests ( 2 pass )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-adlp:         [DMESG-WARN][335] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][337] ([Intel XE#1435]) -> ([PASS][338], [PASS][339])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][340] ([Intel XE#1499]) -> ([PASS][341], [PASS][342])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_vrr@negative-basic.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1392]) -> ([PASS][344], [PASS][345]) +4 other tests ( 2 pass )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1392]) -> [PASS][347] +3 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:
    - shard-bmg:          [DMESG-WARN][348] ([Intel XE#3428]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][350] ([Intel XE#5165]) -> ([PASS][351], [PASS][352])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][353] ([Intel XE#1794]) -> ([PASS][354], [PASS][355])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][356] ([Intel XE#4543] / [Intel XE#4626]) -> [DMESG-FAIL][357] ([Intel XE#4543])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_async_flips@crc-atomic.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][358] ([Intel XE#4626]) -> [FAIL][359] ([Intel XE#3884])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][360] ([Intel XE#3113] / [Intel XE#4345]) -> ([INCOMPLETE][361], [PASS][362]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][363] ([Intel XE#2705] / [Intel XE#4212]) -> ([INCOMPLETE][364], [INCOMPLETE][365]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][366] ([Intel XE#1178]) -> [SKIP][367] ([Intel XE#2341])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][368] ([Intel XE#2341]) -> ([SKIP][369], [FAIL][370]) ([Intel XE#1178] / [Intel XE#2341]) +1 other test ( 1 fail, 1 skip )
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_content_protection@srm.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_content_protection@srm.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][371] ([Intel XE#2341]) -> ([FAIL][372], [FAIL][373]) ([Intel XE#1188])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_content_protection@uevent.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_content_protection@uevent.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][374] ([Intel XE#2291]) -> ([PASS][375], [SKIP][376]) ([Intel XE#2291]) +3 other tests ( 1 pass, 1 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][377] ([Intel XE#2882]) -> ([SKIP][378], [FAIL][379]) ([Intel XE#2316] / [Intel XE#2882])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][380] ([Intel XE#2316]) -> ([FAIL][381], [PASS][382]) ([Intel XE#3321])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][383] ([Intel XE#2316]) -> ([SKIP][384], [PASS][385]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][386] ([Intel XE#2882]) -> ([FAIL][387], [PASS][388]) ([Intel XE#2882])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][389] ([Intel XE#301]) -> ([FAIL][390], [PASS][391]) ([Intel XE#301])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][392] ([Intel XE#301]) -> ([FAIL][393], [PASS][394]) ([Intel XE#301])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][395] ([Intel XE#886]) -> ([FAIL][396], [PASS][397]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][398] ([Intel XE#4760]) -> ([SKIP][399], [SKIP][400]) ([Intel XE#1397] / [Intel XE#1745])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][401] ([Intel XE#4760]) -> ([SKIP][402], [SKIP][403]) ([Intel XE#1397])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][404] ([Intel XE#4543]) -> ([DMESG-FAIL][405], [PASS][406]) ([Intel XE#4543])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][407] ([Intel XE#2311]) -> [SKIP][408] ([Intel XE#2312]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][409] ([Intel XE#2312]) -> ([SKIP][410], [SKIP][411]) ([Intel XE#2311] / [Intel XE#2312]) +10 other tests ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][412] ([Intel XE#2312]) -> ([SKIP][413], [SKIP][414]) ([Intel XE#2311]) +18 other tests ( 2 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][415] ([Intel XE#2311]) -> ([SKIP][416], [SKIP][417]) ([Intel XE#2311] / [Intel XE#2312]) +10 other tests ( 2 skip )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][418] ([Intel XE#4141]) -> ([SKIP][419], [SKIP][420]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#2312]) -> ([SKIP][422], [SKIP][423]) ([Intel XE#4141]) +6 other tests ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][424] ([Intel XE#4141]) -> [SKIP][425] ([Intel XE#2312]) +4 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][426] ([Intel XE#2312]) -> ([SKIP][427], [SKIP][428]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][429] ([Intel XE#4141]) -> ([SKIP][430], [SKIP][431]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][432] ([Intel XE#2311]) -> ([SKIP][433], [SKIP][434]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][435] ([Intel XE#2313]) -> ([SKIP][436], [SKIP][437]) ([Intel XE#2312] / [Intel XE#2313]) +11 other tests ( 2 skip )
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][438] ([Intel XE#2312]) -> ([SKIP][439], [SKIP][440]) ([Intel XE#2312] / [Intel XE#2313]) +8 other tests ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][441] ([Intel XE#2312]) -> ([SKIP][442], [SKIP][443]) ([Intel XE#2313]) +19 other tests ( 2 skip )
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][444] ([Intel XE#2313]) -> ([SKIP][445], [SKIP][446]) ([Intel XE#2312]) +5 other tests ( 2 skip )
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][447] ([Intel XE#2313]) -> [SKIP][448] ([Intel XE#2312]) +7 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][449] ([Intel XE#1503]) -> ([SKIP][450], [PASS][451]) ([Intel XE#1503])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][452] ([Intel XE#3012]) -> ([PASS][453], [SKIP][454]) ([Intel XE#3012])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][455] ([Intel XE#5021]) -> [SKIP][456] ([Intel XE#4596])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][457] ([Intel XE#3325]) -> ([SKIP][458], [SKIP][459]) ([Intel XE#734])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][460] ([Intel XE#1435]) -> ([PASS][461], [SKIP][462]) ([Intel XE#1435])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#362]) -> [FAIL][464] ([Intel XE#1729])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][465], [SKIP][466]) ([Intel XE#2457] / [Intel XE#3428]) -> ([SKIP][467], [SKIP][468]) ([Intel XE#2457])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][469] ([Intel XE#1173]) -> ([FAIL][470], [SKIP][471]) ([Intel XE#1061] / [Intel XE#1173])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_peer2peer@read.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@xe_peer2peer@read.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][472] ([Intel XE#1794]) -> ([ABORT][473], [PASS][474]) ([Intel XE#1794])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5165]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5165
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -> xe-pw-149849v1

  IGT_8396: 8396
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f01d4964a1657117f11
  xe-pw-149849v1: 149849v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/index.html

--===============7651933977040624153==
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
<tr><td><b>Series:</b></td><td>PF: Print debug stuff using debug printer</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149849/">https://patchwork.freedesktop.org/series/149849/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149849v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149849v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a165=
7117f11_FULL -&gt; xe-pw-149849v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149849v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149849v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1498=
49v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-432=
/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg=
2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">DMESG-=
WARN</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149849v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_async_flips@test-cursor.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149849v1/shard-lnl-4/igt@kms_async_flips@test-cursor.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-h=
w-stride-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rota=
te-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149849v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316=
">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149849v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-ad=
lp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49849v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-as=
ync-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +1 other test ( 1 dmesg-fail, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_bw@connected-linear-tili=
ng-4-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_bw@connected-linear-t=
iling-4-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-4-=
tiled-mtl-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other =
test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer=
-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_ccs@missing-ccs-bu=
ffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-d=
g2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html"=
>INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe=
-c-hdmi-a-6.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-=
tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-=
data-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cdclk@plane-scaling.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
49v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) =
+3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_chamelium_audio@dp-audio=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-lnl-6/igt@kms_chamelium_audio@dp-audio.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#3=
73</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_content_protection@lic-t=
ype-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149849v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176"=
>Intel XE#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_content_protection@ueven=
t@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a=
-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2321">Intel XE#2321</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_cursor_legacy@2x-long-no=
nblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_cursor_lega=
cy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sh=
ard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_cursor=
_legacy@cursorb-vs-flipb-toggle.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@=
cursorb-vs-flipb-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_dp_linktra=
in_fallback@dp-fallback.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@=
dp-fallback.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-form=
ats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149849v1/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Int=
el XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149849v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">In=
tel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_flip@2x-absolute-=
wf_vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1421">Intel XE#1421</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-blocking=
-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-463/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sh=
ard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6=
-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149849v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interrup=
tible@ab-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other tes=
t ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-f=
b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-4=
63/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vbl=
ank@a-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbl=
ank@c-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149849v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel X=
E#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4173">Intel XE#4173</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32b=
pp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl=
-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_flip_scale=
d_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adl=
p-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/=
shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuf=
fer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_frontbuffer_trac=
king@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other=
 tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fb=
cpsr-modesetfrombusy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-modesetfrombusy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_hdr@static-swap.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sha=
rd-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_lowres@tiling-4.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</=
a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_plane_multiple@2x=
-tiling-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596=
">Intel XE#4596</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#=
5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_plane_sca=
ling@2x-scaler-multi-pipe.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_plane_scaling@2x-sca=
ler-multi-pipe.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_psr2_sf@fbc-ps=
r2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE=
#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@kms_p=
sr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
08">Intel XE#4608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@=
edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149849v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609"=
>Intel XE#4609</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_psr@pr-basic.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sh=
ard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hd=
mi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2883">Intel XE#2883</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49849v1/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@kms_vrr@=
flipline.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149849v1/shard-lnl-4/igt@kms_vrr@flipline.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl=
-8/igt@kms_vrr@flipline.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test ( 1 fai=
l, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@kms_vrr@negative-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_eu_stall@non-blocking-re=
-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_eudebug_online@writes-cac=
hing-sram-bb-sram-target-sram.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_eudebug_online@wr=
ites-caching-sram-bb-sram-target-sram.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_evict@evict-beng-large-mu=
lti-vm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149849v1/shard-lnl-6/igt@xe_evict@evict-beng-large-multi-vm.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
">Intel XE#688</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-null.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@xe_exec_basic@multigpu-m=
any-execqueues-many-vm-null.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-ex=
ec-basic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec=
-basic-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-ex=
ec-null-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149849v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null=
-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-4=
33/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shar=
d-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-466/igt@xe_exec_reset@pa=
rallel-gt-reset.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-=
reset.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@xe_exec_=
system_allocator@many-large-malloc-busy-nomemset.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-4/=
igt@xe_exec_system_allocator@many-large-malloc-busy-nomemset.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428=
">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-4/igt@xe_exec_system_allocator@man=
y-large-mmap-new-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_system_allocator@man=
y-large-mmap-new-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_system_allocator@man=
y-large-mmap-new-huge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@xe_exec_system_allo=
cator@many-large-mmap-new-huge-nomemset.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@xe_exec_system_allocator@ma=
ny-large-mmap-remap-ro.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@xe_exec_system_allocator@m=
any-large-mmap-remap-ro.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_exec_system_allocator@onc=
e-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_exec_system_allocator@pr=
ocess-many-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +103 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
849v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large=
-new-bo-map-nomemset.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) =
+1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate.html">PASS</a> -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-5/igt@x=
e_exec_threads@threads-hang-fd-userptr-invalidate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/ig=
t@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel=
 XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_mmap@small-bar.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/s=
hard-lnl-4/igt@xe_mmap@small-bar.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_module_load@force-load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-lnl-1/igt@xe_module_load@force-load.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849=
v1/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-4/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
49v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetc=
h.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pxp@pxp-termination-key-u=
pdate-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_render_copy@render-stress=
-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_sriov_scheduling@equal-th=
roughput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149849v1/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/=
igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_async_=
flips@crc@pipe-d-hdmi-a-3.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
849v1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49849v1/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1=
.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition.html">DMESG-FAIL</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3=
/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-=
1/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">DMESG-FAIL</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/=
shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-d=
p-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149849v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149849v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
45">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-mc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-4=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@km=
s_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>) +6 other tests ( 2=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip=
@2x-blocking-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg=
-3/igt@kms_flip@2x-blocking-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bm=
g-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/=
igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>) +7 other =
tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sha=
rd-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1=
/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a>)=
 +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-y-to-x.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149849v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pip=
e-d-hdmi-a-1-y-to-x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_hdr@sta=
tic-toggle-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_=
joiner@basic-force-big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_joiner@basic-for=
ce-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lea=
se@lease-unleased-crtc@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adl=
p-1/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html">PASS</a>) +1 ot=
her test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lea=
se@lease-unleased-crtc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149849v1/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-adlp-1/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.ht=
ml">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-3/igt@kms_plane_scaling@plan=
e-downscale-factor-0-5-with-pixel-format@pipe-a.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_s=
etmode@clone-exclusive-crtc.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_setmode@clone-excl=
usive-crtc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_vrr@negativ=
e-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149849v1/shard-bmg-5/igt@kms_vrr@negative-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard=
-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a>) =
+4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_exec_=
system_allocator@many-large-mmap-mlock-nomemset.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#34=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomem=
set.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5165">Intel XE#5165</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-s=
hared-vm-many-execqueues-new-bo-map-nomemset.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-1/igt@xe_pm@s4-=
vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149849v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.htm=
l">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-a=
dlp-6/igt@kms_async_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard=
-adlp-6/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3=
884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE=
#4345</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149849v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149849v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149849v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#=
4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_content=
_protection@srm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_content_protection@srm.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
78">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2341">Intel XE#2341</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@kms_cont=
ent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_content_protection@ueven=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149849v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_fli=
p@2x-blocking-wf_vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vb=
lank.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-=
bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel=
 XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_flip@2x-pla=
in-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149849v1/shard-bmg-3/igt@kms_flip@2x-plain-flip.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shar=
d-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shar=
d-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">In=
tel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg=
2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-=
432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/sha=
rd-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/=
shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
01">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-3/igt@k=
ms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-2/igt@kms_flip@pla=
in-flip-fb-recreate@a-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fa=
il, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE=
#4760</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xt=
ile-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-downscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4760">Intel XE#4760</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149849v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-lnl-=
4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-=
a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-2=
/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-6/igt@kms=
_flip_tiling@flip-change-tiling.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849=
v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149849v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-ind=
fb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnds=
crn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149849v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
849v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb=
-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149849v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn=
-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
849v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb=
-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn=
-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9849v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/igt@kms_hdr@invalid-hd=
r.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-=
3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-1/ig=
t@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpm=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-b=
mg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-=
6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#14=
35</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-434/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/i=
gt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-bm=
g-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149849v1/shard-bmg-2/igt@xe_module_load@load.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-dg2-436/igt@xe_peer2peer@rea=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149849v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Int=
el XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v1/shard-adlp-9/igt@xe_pm@s4-v=
m-bind-userptr.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149849v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/179=
4">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -&gt; xe-pw-149=
849v1</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f0=
1d4964a1657117f11<br />
  xe-pw-149849v1: 149849v1</p>

</body>
</html>

--===============7651933977040624153==--
