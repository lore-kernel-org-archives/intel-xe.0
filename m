Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD9C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12810E6B9;
	Tue,  5 Aug 2025 15:31:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188F10E6B6;
 Tue,  5 Aug 2025 15:31:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6622635361821629539=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/i915/tc=3A_Fix_enabled?=
 =?utf-8?q?/disconnected_DP-alt_sink_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 15:31:42 -0000
Message-ID: <175440790298.214076.17911586807241275059@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250805073700.642107-1-imre.deak@intel.com>
In-Reply-To: <20250805073700.642107-1-imre.deak@intel.com>
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

--===============6622635361821629539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/tc: Fix enabled/disconnected DP-alt sink handling (rev3)
URL   : https://patchwork.freedesktop.org/series/152514/
State : success

== Summary ==

CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b_FULL -> xe-pw-152514v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152514v3_FULL:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-render-node-idle}:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_pmu@engine-activity-render-node-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-152514v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2233])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#911])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#873])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543]) +3 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1512]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +174 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2907])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#3124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4417]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2325])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_chamelium_edid@vga-edid-read.html
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2390])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-4/igt@kms_cursor_crc@cursor-random-128x42.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#455]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1424]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#309])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#4633])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#323])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1340])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#4354])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#4331])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#4294])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#4331])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4422])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4422])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#310]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2316]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#4543]) +23 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +10 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2380])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1397] / [Intel XE#1745])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1397])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][78] -> [DMESG-FAIL][79] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#352])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#651]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2311]) +12 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#5390]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#651]) +21 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#656]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +15 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2312]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#653]) +21 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#656]) +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#653]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1503])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_hdr@static-toggle-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#346])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#346])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#346])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#346])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2934])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2927])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2927])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4329])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4596])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4596])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4596]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#309]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2938])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#870])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#870]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#718]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2893] / [Intel XE#4608])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1489])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4608]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1489]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1489]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1406]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4609])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#5298]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_psr@psr2-suspend@edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1127]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#3414])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][128] -> [FAIL][129] ([Intel XE#2883]) +2 other tests fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1435])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][131] -> [SKIP][132] ([Intel XE#1435])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#4459]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1499])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1091] / [Intel XE#2849])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1091] / [Intel XE#2849])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1091] / [Intel XE#2849])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1447] / [Intel XE#5617])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1123])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2504])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#944])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-read:
    - shard-bmg:          [PASS][143] -> [FAIL][144] ([Intel XE#5420])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_eu_stall@blocking-read.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#5626])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4837]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4837]) +10 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4837]) +10 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#261] / [Intel XE#5564])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#688]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1392]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][155] -> [SKIP][156] ([Intel XE#1392]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2322]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288] / [Intel XE#5561]) +8 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#288]) +23 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][160] -> [DMESG-WARN][161] ([Intel XE#3876])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4943]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#4915] / [Intel XE#5560]) +58 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#4915]) +212 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4943]) +7 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][166] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#560])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#512])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193]) -> ([PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [SKIP][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219]) ([Intel XE#2457])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][220] -> [INCOMPLETE][221] ([Intel XE#2594])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-435/igt@xe_module_load@unload.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_module_load@unload.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#3573])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#3573]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2838] / [Intel XE#979])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#2427])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_peer2peer@write.html
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#1061] / [Intel XE#5568])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1061])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][228] ([Intel XE#1173]) +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#2284] / [Intel XE#366])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#2284] / [Intel XE#366])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#584])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#579])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][234] ([Intel XE#4733]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#4733])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#4733]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#4733] / [Intel XE#5594])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#944]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#944])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#944]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#4821])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#4130])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#4130])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#4273])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][245] ([Intel XE#4963]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][247] ([Intel XE#2134]) -> [PASS][248] +3 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@info.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][249] ([Intel XE#4665]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][251] ([Intel XE#911]) -> [PASS][252] +3 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][253] ([Intel XE#4947]) -> [PASS][254] +21 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][255] ([Intel XE#3862]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#3862]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][259] ([Intel XE#3124]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][261] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][263] ([Intel XE#2291]) -> [PASS][264] +4 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][265] ([Intel XE#4950]) -> [PASS][266] +125 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][267] ([Intel XE#2316]) -> [PASS][268] +4 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [DMESG-WARN][269] ([Intel XE#4543]) -> [PASS][270] +2 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][271] ([Intel XE#301]) -> [PASS][272] +2 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][273] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][275] ([Intel XE#5416]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][277] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][279] ([Intel XE#4543]) -> [PASS][280] +10 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#455]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][283] ([Intel XE#1503]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@static-swap.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][285] ([Intel XE#4596]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][287] ([Intel XE#718]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][289] ([Intel XE#4962]) -> [PASS][290] +1 other test pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * {igt@xe_compute_preempt@compute-preempt-many-vram}:
    - shard-bmg:          [ABORT][291] ([Intel XE#3970]) -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1392]) -> [PASS][294] +5 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][295] ([Intel XE#3876]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - shard-bmg:          [SKIP][297] ([Intel XE#4945]) -> [PASS][298] +570 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][299] ([Intel XE#5018]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#5531]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-adlp:         [TIMEOUT][303] ([Intel XE#5531]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [DMESG-WARN][305] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s4-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][307] ([Intel XE#4950]) -> [SKIP][308] ([Intel XE#873])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][309] ([Intel XE#4947]) -> [SKIP][310] ([Intel XE#2327]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][311] ([Intel XE#4947]) -> [SKIP][312] ([Intel XE#1124]) +16 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][313] ([Intel XE#4950]) -> [SKIP][314] ([Intel XE#2314] / [Intel XE#2894])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][315] ([Intel XE#4950]) -> [SKIP][316] ([Intel XE#367]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][317] ([Intel XE#4947]) -> [SKIP][318] ([Intel XE#3432]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][319] ([Intel XE#4947]) -> [SKIP][320] ([Intel XE#2887]) +17 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][321] ([Intel XE#4947]) -> [SKIP][322] ([Intel XE#2724])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][323] ([Intel XE#4950]) -> [SKIP][324] ([Intel XE#2252]) +12 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][325] ([Intel XE#4950]) -> [SKIP][326] ([Intel XE#2325]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][327] ([Intel XE#4950]) -> [FAIL][328] ([Intel XE#1178])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][329] ([Intel XE#4950]) -> [SKIP][330] ([Intel XE#2390])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][331] ([Intel XE#2341]) -> [FAIL][332] ([Intel XE#1178])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][333] ([Intel XE#4950]) -> [SKIP][334] ([Intel XE#2320]) +6 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][335] ([Intel XE#4950]) -> [FAIL][336] ([Intel XE#1475])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][337] ([Intel XE#4947]) -> [SKIP][338] ([Intel XE#4354])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][339] ([Intel XE#4947]) -> [SKIP][340] ([Intel XE#4331])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][341] ([Intel XE#4947]) -> [SKIP][342] ([Intel XE#2244])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][343] ([Intel XE#4945]) -> [SKIP][344] ([Intel XE#4422])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][345] ([Intel XE#4947]) -> [SKIP][346] ([Intel XE#5425])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][347] ([Intel XE#4950]) -> [SKIP][348] ([Intel XE#2374])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][349] ([Intel XE#4950]) -> [SKIP][350] ([Intel XE#2316]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [TIMEOUT][351] ([Intel XE#1504]) -> [TIMEOUT][352] ([Intel XE#1504] / [Intel XE#5737]) +1 other test timeout
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][353] ([Intel XE#4947]) -> [SKIP][354] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][355] ([Intel XE#4947]) -> [SKIP][356] ([Intel XE#2380])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][357] ([Intel XE#4947]) -> [SKIP][358] ([Intel XE#2311]) +37 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][359] ([Intel XE#2312]) -> [SKIP][360] ([Intel XE#2311]) +8 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][361] ([Intel XE#4947]) -> [SKIP][362] ([Intel XE#5390]) +16 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][363] ([Intel XE#4543]) -> [FAIL][364] ([Intel XE#5671])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][365] ([Intel XE#2312]) -> [SKIP][366] ([Intel XE#5390]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][367] ([Intel XE#5390]) -> [SKIP][368] ([Intel XE#2312]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][369] ([Intel XE#4947]) -> [SKIP][370] ([Intel XE#5427])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2311]) -> [SKIP][372] ([Intel XE#2312]) +6 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][373] ([Intel XE#4947]) -> [SKIP][374] ([Intel XE#2352]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][375] ([Intel XE#4947]) -> [SKIP][376] ([Intel XE#2312]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][377] ([Intel XE#4947]) -> [SKIP][378] ([Intel XE#2313]) +39 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][379] ([Intel XE#4947]) -> [SKIP][380] ([Intel XE#2350])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][381] ([Intel XE#2313]) -> [SKIP][382] ([Intel XE#2312]) +5 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][383] ([Intel XE#2312]) -> [SKIP][384] ([Intel XE#2313]) +7 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][385] ([Intel XE#4947]) -> [SKIP][386] ([Intel XE#3012])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][387] ([Intel XE#4947]) -> [SKIP][388] ([Intel XE#346])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][389] ([Intel XE#4947]) -> [SKIP][390] ([Intel XE#4090])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][391] ([Intel XE#4950]) -> [SKIP][392] ([Intel XE#4596])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][393] ([Intel XE#4950]) -> [SKIP][394] ([Intel XE#2763])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][395] ([Intel XE#4947]) -> [SKIP][396] ([Intel XE#870])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][397] ([Intel XE#4947]) -> [SKIP][398] ([Intel XE#2499])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][399] ([Intel XE#4962]) -> [SKIP][400] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][401] ([Intel XE#4947]) -> [SKIP][402] ([Intel XE#1489]) +9 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][403] ([Intel XE#2893]) -> [SKIP][404] ([Intel XE#1489])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][405] ([Intel XE#4947]) -> [SKIP][406] ([Intel XE#2387]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][407] ([Intel XE#4947]) -> [SKIP][408] ([Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][409] ([Intel XE#4947]) -> [SKIP][410] ([Intel XE#2414])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][411] ([Intel XE#4950]) -> [SKIP][412] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][413] ([Intel XE#4950]) -> [SKIP][414] ([Intel XE#2330])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][415] ([Intel XE#4950]) -> [SKIP][416] ([Intel XE#2413])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1500]) -> [SKIP][418] ([Intel XE#362])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][419] ([Intel XE#4950]) -> [SKIP][420] ([Intel XE#1499])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_vrr@flipline.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_vrr@flipline.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][421] ([Intel XE#4945]) -> [SKIP][422] ([Intel XE#4837]) +15 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][423] ([Intel XE#4945]) -> [SKIP][424] ([Intel XE#4518]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][425] ([Intel XE#4945]) -> [SKIP][426] ([Intel XE#2322]) +11 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][427] ([Intel XE#4945]) -> [SKIP][428] ([Intel XE#4943]) +28 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][429] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][430] ([Intel XE#5530])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][431] ([Intel XE#4945]) -> [ABORT][432] ([Intel XE#5530])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][433] ([Intel XE#4945]) -> [SKIP][434] ([Intel XE#586])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_mmap@small-bar.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][435] ([Intel XE#4945]) -> [SKIP][436] ([Intel XE#2248])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][437] ([Intel XE#4945]) -> [SKIP][438] ([Intel XE#1420])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][439] ([Intel XE#4945]) -> [SKIP][440] ([Intel XE#2245])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][441] ([Intel XE#4945]) -> [SKIP][442] ([Intel XE#2284]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][443] ([Intel XE#4945]) -> [SKIP][444] ([Intel XE#4650]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][445] ([Intel XE#4945]) -> [SKIP][446] ([Intel XE#4733]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][447] ([Intel XE#4945]) -> [SKIP][448] ([Intel XE#944]) +6 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][449] ([Intel XE#4945]) -> [SKIP][450] ([Intel XE#4130]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][451] ([Intel XE#4945]) -> [SKIP][452] ([Intel XE#3342])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5298
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5617
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671
  [Intel XE#5737]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8486 -> IGT_8487
  * Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -> xe-pw-152514v3

  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8487: 8487
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b
  xe-pw-152514v3: 152514v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/index.html

--===============6622635361821629539==
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
<tr><td><b>Series:</b></td><td>drm/i915/tc: Fix enabled/disconnected DP-alt=
 sink handling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152514/">https://patchwork.freedesktop.org/series/152514/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152514v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152514v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d=
1a2345b_FULL -&gt; xe-pw-152514v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1525=
14v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@engine-activity-render-node-idle}:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_pmu@engine-activity-rend=
er-node-idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152514v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2514v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-a=
dlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_bw@linear-tiling-4-displ=
ays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</=
li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_chamelium_color@ctm-0-5=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_chamelium_edid@vga-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@kms_chamelium_edid@vga-edid-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_cursor_crc@=
cursor-random-128x42.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_cursor_crc@cursor-random=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-3/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-4=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152514v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_plane_multiple@2x-tiling=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane=
-onoff@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@kms_psr@psr-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_psr@=
psr2-suspend@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5298">Intel XE#5298</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-9/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5617">Intel XE#5617</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_eu_st=
all@blocking-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_eu_stall@blocking-read.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5420">Intel XE#5420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_eudebug@basic-client.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@xe_eudebug_online@set-breakp=
oint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@xe_evict@evict-beng-large-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-6/igt@xe_exec_fault_mode@many-inva=
lid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-466/igt@xe_exec_fault_mode@once-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-remap-ro.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +5=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +212 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#55=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2=
345b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082=
d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a=
2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f=
7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601=
b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c6=
3601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415a=
e8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e=
415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79d=
fb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-=
c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-435/igt@xe_mod=
ule_load@unload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-464/igt@xe_module_load@unload.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe_oa@invalid-remove-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5568">Intel XE#5568</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-8/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-2/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-dg2-432/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hot=
unplug@hotrebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@core_hotunplug=
@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@fbdev@info.html">PASS</a> +3=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152514v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
514v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-asy=
nc-flip.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard=
-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152514v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +4 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152514v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +125 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg=
-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_fli=
p@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard=
-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shar=
d-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#5416</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-=
463/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152514v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-y-to-x.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-436/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>{igt@xe_compute_preempt@compute-preempt-many-vram}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_compu=
te_preempt@compute-preempt-many-vram.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg=
-7/igt@xe_compute_preempt@compute-preempt-many-vram.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-=
dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@x=
e_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-large-mmap-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-mmap-nomem=
set.html">PASS</a> +570 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152514v3/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531">Intel XE#=
5531</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152514v3/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_se=
nd_recv.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531">Intel XE#5531=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_re=
cv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s=
4-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-adlp-1/igt@xe=
_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_=
async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/sh=
ard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard=
-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg=
-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@km=
s_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/sha=
rd-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">=
Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v=
3/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms=
_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip=
@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-5=
/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737">In=
tel XE#5737</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152514v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152514v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
514v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152514v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152514v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pr=
i-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5671">Intel XE#5671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#53=
90</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@kms=
_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/sha=
rd-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2514v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152514v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_j=
oiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard=
-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@kms_=
pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shar=
d-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-lnl-3/i=
gt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-4/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-5/igt@kms_psr@fbc-p=
r-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +19 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/sha=
rd-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_r=
otation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bm=
g-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_vrr@=
flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@kms_vrr@flipline.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_eudebug_=
sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4518">Intel XE#4518</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
514v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
14v3/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4943">Intel XE#4943</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Int=
el XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152514v3/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct=
_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3=
/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-1/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-8/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-2/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-3/igt@x=
e_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-6/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152514v3/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-=
reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov=
_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152514v3/shard-bmg-7/igt@xe_srio=
v_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8486 -&gt; IGT_8487</li>
<li>Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -&gt; xe-pw-152=
514v3</li>
</ul>
<p>IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8487: 8487<br />
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02=
f7b3a2082d1a2345b<br />
  xe-pw-152514v3: 152514v3</p>

</body>
</html>

--===============6622635361821629539==--
