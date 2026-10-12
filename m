Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB4CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0385E10E50F;
	Mon, 12 Oct 2026 14:20:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB1E10E129;
 Mon, 12 Oct 2026 14:19:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6820030180605193858=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Add_support_to_handle_memo?=
 =?utf-8?q?ry_double-bit_ecc_errors_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 14:19:57 -0000
Message-ID: <179181479788.13159.747231350165694543@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012054056.2272869-8-riana.tauro@intel.com>
In-Reply-To: <20261012054056.2272869-8-riana.tauro@intel.com>
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

--===============6820030180605193858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support to handle memory double-bit ecc errors (rev5)
URL   : https://patchwork.freedesktop.org/series/172710/
State : success

== Summary ==

CI Bug Log - changes from xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431_FULL -> xe-pw-172710v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-172710v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][1] -> ([PASS][2], [ABORT][3]) ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1125] / [Intel XE#7312])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-ptl:          NOTRUN -> ([SKIP][5], [SKIP][6]) ([Intel XE#3157])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][9] -> ([ABORT][10], [PASS][11]) ([Intel XE#9399] / [Intel XE#9409]) +1 other test ( 1 abort, 1 pass )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3658] / [Intel XE#7360])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> ([SKIP][15], [SKIP][16]) ([Intel XE#6925])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5901])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#5901])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][24] -> ([PASS][25], [INCOMPLETE][26]) ([Intel XE#6819])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#1477] / [Intel XE#7361])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5808]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#5808]) +11 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][33], [SKIP][34]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#7679])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#7679])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7679])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#7679]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#2669] / [Intel XE#7389]) +3 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2652]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2887]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#5822]) +9 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([PASS][57], [INCOMPLETE][58]) ([Intel XE#7084] / [Intel XE#8150])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#3432])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#3432])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2887]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5822]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#5823] / [Intel XE#6918]) +4 other tests ( 2 skip )
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#2652]) +3 other tests ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#9219]) +4 other tests ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#306] / [Intel XE#7358])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_color@degamma.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-ptl:          NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#5824])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_color@gamma.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2325] / [Intel XE#7358])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#8391])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-lnl:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#7358])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7358]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-ptl:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#8391])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#2252]) +6 other tests ( 2 skip )
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#2252]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2252]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#373])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#373]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7642]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][89] ([Intel XE#3304])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2390] / [Intel XE#6974])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
    - shard-ptl:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#5832] / [Intel XE#6974])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_content_protection@dp-mst-type-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-lnl:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#7642])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_content_protection@legacy-hdcp14.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][95], [FAIL][96]) ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-ptl:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#7642]) +1 other test ( 2 skip )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_content_protection@lic-type-0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][99] ([Intel XE#3304] / [Intel XE#7374])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5900])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2320]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2321] / [Intel XE#7355])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-ptl:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#5846]) +2 other tests ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#1424])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x32.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-ptl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#5900])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_crc@cursor-random-64x21.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1424]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][110] -> ([ABORT][111], [PASS][112]) ([Intel XE#9375]) +1 other test ( 1 abort, 1 pass )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-ptl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#5962]) +6 other tests ( 2 skip )
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#309] / [Intel XE#7343])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-ptl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#5962] / [Intel XE#7343])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#9537])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([Intel XE#8265]) +1 other test ( 2 skip )
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_dsc@dsc-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#8265])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5907])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1138] / [Intel XE#7344])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#8586])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2374] / [Intel XE#6127])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#1421])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-ptl:          NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#2316]) +4 other tests ( 2 skip )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip@2x-flip-vs-modeset.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#2316]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1421]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][134] -> ([FAIL][135], [PASS][136]) ([Intel XE#3321])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][137] -> ([PASS][138], [FAIL][139]) ([Intel XE#301])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][140] -> ([FAIL][141], [FAIL][142]) ([Intel XE#301]) +1 other test ( 2 fail )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
    - shard-bmg:          [PASS][143] -> [FAIL][144] ([Intel XE#3321])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-ptl:          NOTRUN -> ([PASS][145], [ABORT][146]) ([Intel XE#9362]) +1 other test ( 1 abort, 1 pass )
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> ([SKIP][147], [SKIP][148]) ([Intel XE#5828]) +1 other test ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#5828]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#7178] / [Intel XE#7349])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][152], [SKIP][153]) ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][154], [SKIP][155]) ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#7178] / [Intel XE#7351])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#7178])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-ptl:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([Intel XE#7178]) +4 other tests ( 2 skip )
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#6312] / [Intel XE#651]) +2 other tests ( 2 skip )
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-ptl:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#5800] / [Intel XE#6312]) +7 other tests ( 2 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#7061] / [Intel XE#7356]) +3 other tests ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([Intel XE#6312]) +2 other tests ( 2 skip )
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#7905]) +23 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2311]) +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#4141])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([Intel XE#5812]) +58 other tests ( 2 skip )
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#656] / [Intel XE#7905]) +21 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#4141]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#7061] / [Intel XE#7356])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#1469] / [Intel XE#7399])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][184] ([Intel XE#5800] / [Intel XE#6312]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#6312]) +6 other tests ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#6312]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][190] ([Intel XE#5812]) +16 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#7905]) +10 other tests ( 2 skip )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#7061]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-ptl:          NOTRUN -> [SKIP][194] ([Intel XE#6312]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][195] ([Intel XE#7061]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#656] / [Intel XE#7905]) +7 other tests ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#7865]) +20 other tests ( 2 skip )
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2313]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2313]) +11 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#7865]) +14 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][204] ([Intel XE#7865]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#7061]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-bmg:          [PASS][206] -> [ABORT][207] ([Intel XE#9362])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#7865]) +8 other tests ( 2 skip )
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#7061]) +4 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          [PASS][212] -> ([PASS][213], [ABORT][214]) ([Intel XE#9362]) +6 other tests ( 1 abort, 1 pass )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_hdr@bpc-switch-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#3374] / [Intel XE#3544])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][216] -> ([SKIP][217], [PASS][218]) ([Intel XE#1503])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#1503])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_hdr@static-toggle.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][221] -> ([PASS][222], [DMESG-WARN][223]) ([Intel XE#9365] / [Intel XE#9474])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          [PASS][224] -> ([DMESG-WARN][225], [PASS][226]) ([Intel XE#9365]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-ptl:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#6900])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_joiner@basic-ultra-joiner.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-ptl:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#6901])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#7173] / [Intel XE#7294])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-ptl:          NOTRUN -> [SKIP][232] ([Intel XE#7591])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-ptl:          NOTRUN -> ([SKIP][233], [SKIP][234]) ([Intel XE#6912])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][235] ([Intel XE#7283]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-ptl:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#7283]) +3 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_plane@pixel-format-x-tiled-modifier.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#7283])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#7283])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-ptl:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#6886]) +4 other tests ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][242] ([Intel XE#6886]) +9 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#3309] / [Intel XE#7368])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][244] -> [FAIL][245] ([Intel XE#2029] / [Intel XE#7395])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-ptl:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#7304]) +2 other tests ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#1489]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][250] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#4608])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#4608] / [Intel XE#7304])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#2893] / [Intel XE#7304])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][255] ([Intel XE#7304])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][257] ([Intel XE#1128] / [Intel XE#7413])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][258] ([Intel XE#7413])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][259] ([Intel XE#1406])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#1406] / [Intel XE#7345])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][261] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-ptl:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#1406] / [Intel XE#5835]) +1 other test ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_psr@fbc-psr2-dpms.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][264] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#1406]) +3 other tests ( 2 skip )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr@pr-no-drrs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#1406]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2234])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][271] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#1127] / [Intel XE#5813])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#1127] / [Intel XE#5813])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#5821]) +1 other test ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][277] ([Intel XE#5813])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#5813])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#2413])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([Intel XE#1435] / [Intel XE#9142])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#1435] / [Intel XE#9142])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][284] ([Intel XE#1729] / [Intel XE#7424])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][285] ([Intel XE#5848])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][286] ([Intel XE#330] / [Intel XE#5857])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-ptl:          [PASS][287] -> ([ABORT][288], [ABORT][289]) ([Intel XE#9362] / [Intel XE#9375])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@kms_vblank@ts-continuation-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vblank@ts-continuation-suspend.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1:
    - shard-ptl:          [PASS][290] -> [ABORT][291] ([Intel XE#9375])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#9271]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][293] -> ([PASS][294], [FAIL][295]) ([Intel XE#4227] / [Intel XE#7397]) +3 other tests ( 1 fail, 1 pass )
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#2168] / [Intel XE#7444])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][297] ([Intel XE#1447] / [Intel XE#7471])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-ptl:          NOTRUN -> ([SKIP][298], [SKIP][299]) ([Intel XE#5191])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][300] -> ([ABORT][301], [PASS][302]) ([Intel XE#9481]) +1 other test ( 1 abort, 1 pass )
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#6540] / [Intel XE#688]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][304] -> ([PASS][305], [INCOMPLETE][306]) ([Intel XE#6321] / [Intel XE#8355])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][307] ([Intel XE#5764]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-lnl:          NOTRUN -> ([SKIP][308], [SKIP][309]) ([Intel XE#6540] / [Intel XE#688]) +1 other test ( 2 skip )
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_evict@evict-threads-large.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#5764]) +6 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_evict@evict-threads-small-multi-vm.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-ptl:          NOTRUN -> ([SKIP][312], [SKIP][313]) ([Intel XE#6144])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][314] ([Intel XE#7482]) +9 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#7482]) +3 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_balancer@once-parallel-userptr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_balancer@once-parallel-userptr.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-ptl:          NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#7482]) +13 other tests ( 2 skip )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_exec_balancer@once-virtual-rebind.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][319] ([Intel XE#7482]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#1392]) +1 other test ( 2 skip )
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-ptl:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([Intel XE#5575] / [Intel XE#7484]) +5 other tests ( 2 skip )
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][325] ([Intel XE#1392]) +3 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-ptl:          NOTRUN -> [SKIP][326] ([Intel XE#5575] / [Intel XE#7484])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][327] -> ([PASS][328], [FAIL][329]) ([Intel XE#8578])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-ptl:          NOTRUN -> ([SKIP][330], [SKIP][331]) ([Intel XE#8374]) +8 other tests ( 2 skip )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> ([SKIP][332], [SKIP][333]) ([Intel XE#8374]) +3 other tests ( 2 skip )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][334] ([Intel XE#8374]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][335] ([Intel XE#8374]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][336] ([Intel XE#8374]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> ([SKIP][337], [SKIP][338]) ([Intel XE#8364]) +1 other test ( 2 skip )
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@max-queues-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][339] ([Intel XE#8364]) +5 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_multi_queue@max-queues-userptr.html

  * igt@xe_exec_multi_queue@one-queue-basic:
    - shard-ptl:          NOTRUN -> ([SKIP][340], [SKIP][341]) ([Intel XE#8364]) +19 other tests ( 2 skip )
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_exec_multi_queue@one-queue-basic.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-basic.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][342] ([Intel XE#8364]) +12 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][343] ([Intel XE#8364]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> ([SKIP][344], [SKIP][345]) ([Intel XE#8364]) +7 other tests ( 2 skip )
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-lnl:          NOTRUN -> [SKIP][346] ([Intel XE#8369])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-ptl:          NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#8369]) +1 other test ( 2 skip )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][349] ([Intel XE#8369])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [FAIL][350] ([Intel XE#9096])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#8378])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#8378]) +3 other tests ( 2 skip )
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][355] ([Intel XE#8378]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-lnl:          NOTRUN -> ([SKIP][356], [SKIP][357]) ([Intel XE#8378]) +2 other tests ( 2 skip )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][358] ([Intel XE#8378]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][359] ([Intel XE#8378]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][360] ([Intel XE#560] / [Intel XE#7321] / [Intel XE#7453])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][361] ([Intel XE#5867])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][362] ([Intel XE#1416])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_mmap@vram.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-lnl:          NOTRUN -> [SKIP][363] ([Intel XE#6964]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][364] ([Intel XE#6964])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-ptl:          NOTRUN -> ([SKIP][365], [SKIP][366]) ([Intel XE#6964]) +1 other test ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-lnl:          NOTRUN -> ([SKIP][367], [SKIP][368]) ([Intel XE#6964])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][369] ([Intel XE#6964])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-ptl:          NOTRUN -> ([SKIP][370], [SKIP][371]) ([Intel XE#7793])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_page_reclaim@basic-mixed.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-lnl:          NOTRUN -> [SKIP][372] ([Intel XE#7793])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-ptl:          NOTRUN -> [SKIP][373] ([Intel XE#7793])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#7793])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_page_reclaim@random.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][376] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-i2c:
    - shard-ptl:          NOTRUN -> ([SKIP][377], [SKIP][378]) ([Intel XE#5741]) +1 other test ( 2 skip )
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@xe_pm@d3cold-i2c.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][379] ([Intel XE#2284] / [Intel XE#7370])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][380] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [PASS][381] -> [ABORT][382] ([Intel XE#9362])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@xe_pm@s4-basic-exec.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][383] -> ([ABORT][384], [PASS][385]) ([Intel XE#9362])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-1/igt@xe_pm@s4-exec-after.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][386] -> [ABORT][387] ([Intel XE#9362])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][388] ([Intel XE#4650] / [Intel XE#7347])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][389] ([Intel XE#7599])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault-svm.html
    - shard-ptl:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([Intel XE#7599])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#4733] / [Intel XE#7417])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#944])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_query@multigpu-query-hwconfig.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-ptl:          NOTRUN -> [SKIP][396] ([Intel XE#6019])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-ptl:          NOTRUN -> ([SKIP][397], [SKIP][398]) ([Intel XE#6019]) +2 other tests ( 2 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_query@multigpu-query-oa-units.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][399] ([Intel XE#944])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][400] ([Intel XE#7174])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html

  * igt@xe_sriov_admin@sched-priority-vf-write-denied:
    - shard-lnl:          NOTRUN -> ([SKIP][401], [SKIP][402]) ([Intel XE#7174])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_sriov_admin@sched-priority-vf-write-denied.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-lnl:          NOTRUN -> [SKIP][403] ([Intel XE#8339])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          NOTRUN -> [SKIP][404] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][405] ([Intel XE#7892])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][406] ([Intel XE#8963])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][407] ([Intel XE#8963])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][408] ([Intel XE#3718] / [Intel XE#6078]) -> ([PASS][409], [PASS][410])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][411] ([Intel XE#6078]) -> ([PASS][412], [PASS][413])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][414] ([Intel XE#8098] / [Intel XE#9561]) -> ([PASS][415], [PASS][416]) +1 other test ( 2 pass )
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][417] ([Intel XE#367]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][419] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-ptl:          [ABORT][421] ([Intel XE#9362]) -> ([PASS][422], [PASS][423]) +8 other tests ( 2 pass )
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@kms_pm_backlight@fade-with-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_pm_backlight@fade-with-suspend.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [ABORT][424] ([Intel XE#9463]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][426] ([Intel XE#9362]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][428] ([Intel XE#9362]) -> ([PASS][429], [PASS][430])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][431] ([Intel XE#3718] / [Intel XE#6078]) -> ([PASS][432], [FAIL][433]) ([Intel XE#3718] / [Intel XE#6078]) +1 other test ( 1 fail, 1 pass )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][434] ([Intel XE#7084] / [Intel XE#8150]) -> ([INCOMPLETE][435], [PASS][436]) ([Intel XE#7084] / [Intel XE#8150])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][437] ([Intel XE#7809]) -> ([FAIL][438], [PASS][439]) ([Intel XE#7809])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [ABORT][440] ([Intel XE#9362]) -> ([PASS][441], [FAIL][442]) ([Intel XE#4227] / [Intel XE#7397]) +1 other test ( 1 fail, 1 pass )
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][443] ([Intel XE#7695]) -> ([ABORT][444], [FAIL][445]) ([Intel XE#7695] / [Intel XE#9362])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html
    - shard-ptl:          [FAIL][446] ([Intel XE#7695]) -> ([FAIL][447], [ABORT][448]) ([Intel XE#7695] / [Intel XE#9362])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-8/igt@xe_pat@pat-sw-hw-suspend.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_pat@pat-sw-hw-suspend.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [DMESG-WARN][449] ([Intel XE#7727]) -> ([ABORT][450], [ABORT][451]) ([Intel XE#9362])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@xe_pm@s4-mocs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_pm@s4-mocs.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#9409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9474
  [Intel XE#9481]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481
  [Intel XE#9537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537
  [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561


Build changes
-------------

  * Linux: xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431 -> xe-pw-172710v5

  IGT_9138: 9138
  xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431: 0f28405022887336d4fc1fe1a0e1429146c2d431
  xe-pw-172710v5: 172710v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/index.html

--===============6820030180605193858==
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
<tr><td><b>Series:</b></td><td>Add support to handle memory double-bit ecc errors (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172710/">https://patchwork.freedesktop.org/series/172710/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431_FULL -&gt; xe-pw-172710v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172710v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409">Intel XE#9409</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219">Intel XE#9219</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_color@degamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_color@gamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_content_protection@lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537">Intel XE#9537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_dsc@dsc-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +58 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_hdr@bpc-switch-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +6 other tests ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_hdr@static-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_hdr@static-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9474">Intel XE#9474</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_psr@pr-no-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471">Intel XE#7471</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481">Intel XE#9481</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_evict@evict-threads-large.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_evict@evict-threads-large.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_balancer@once-parallel-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_balancer@once-parallel-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_multi_queue@max-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_exec_multi_queue@one-queue-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_exec_reset@multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">Intel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_page_reclaim@basic-mixed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_page_reclaim@basic-mixed.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_page_reclaim@random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_page_reclaim@random.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-8/igt@xe_pm@d3cold-i2c.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_pm@d3cold-i2c.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-1/igt@xe_pm@s4-exec-after.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347">Intel XE#7347</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-5/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_query@multigpu-query-oa-units.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_query@multigpu-query-oa-units.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-vf-write-denied:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_sriov_admin@sched-priority-vf-write-denied.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-8/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-5/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561">Intel XE#9561</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@kms_pm_backlight@fade-with-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a>) +8 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-8/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-1/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-2/igt@xe_pat@pat-sw-hw-suspend.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431/shard-ptl-1/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-4/igt@xe_pm@s4-mocs.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172710v5/shard-ptl-3/igt@xe_pm@s4-mocs.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431 -&gt; xe-pw-172710v5</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5928-0f28405022887336d4fc1fe1a0e1429146c2d431: 0f28405022887336d4fc1fe1a0e1429146c2d431<br />
  xe-pw-172710v5: 172710v5</p>

</body>
</html>

--===============6820030180605193858==--
