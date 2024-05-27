Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3566C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFDE10E285;
	Mon, 27 May 2024 14:05:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DC810E285;
 Mon, 27 May 2024 14:05:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3570359661432086457=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe/xe2=3A_Enable_Priority_M?=
 =?utf-8?q?em_Read?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 14:05:24 -0000
Message-ID: <171681872472.2213173.12023897107797922473@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
In-Reply-To: <20240525004933.1124012-1-pallavi.mishra@intel.com>
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

--===============3570359661432086457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Enable Priority Mem Read
URL   : https://patchwork.freedesktop.org/series/134038/
State : success

== Summary ==

CI Bug Log - changes from xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_full -> xe-pw-134038v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134038v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-lnl}:        NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-1/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-6/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-3/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-3/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-8/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-6/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-3/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-8/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-7/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-7/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-1/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-7/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-2/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-2/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-2/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-134038v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +13 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1204])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#316]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][31] ([Intel XE#1231]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +44 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma:
    - shard-dg2-set2:     [PASS][42] -> [ABORT][43] ([Intel XE#1939]) +4 other tests abort
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#307]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#308])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][47] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#581])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#323])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][52] ([Intel XE#1214] / [Intel XE#282])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#323])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1137] / [Intel XE#1201])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1135] / [Intel XE#1201])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:
    - shard-adlp:         [PASS][64] -> [INCOMPLETE][65] ([Intel XE#1195]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201]) +31 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][69] ([Intel XE#324]) +1 other test dmesg-fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][71] ([Intel XE#1861])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#656]) +50 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#417])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#829]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][81] ([Intel XE#1162]) +1 other test dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][82] ([Intel XE#1191] / [Intel XE#1214]) +8 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#361]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#870])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_pm_backlight@fade.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#780])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1122] / [Intel XE#1201])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][92] ([Intel XE#1874]) +7 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1127] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [ABORT][95] ([Intel XE#1939]) +2 other tests abort
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#455]) +24 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#756])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1123] / [Intel XE#1201])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1126] / [Intel XE#1201])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1473])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][102] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][104] -> [TIMEOUT][105] ([Intel XE#1473] / [Intel XE#392])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#1392]) +11 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#288]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#288]) +29 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][111] ([Intel XE#1214] / [Intel XE#1638])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
    - shard-adlp:         NOTRUN -> [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#1638])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [PASS][113] -> [DMESG-WARN][114] ([Intel XE#1214] / [Intel XE#1238])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [ABORT][115] ([Intel XE#1205] / [Intel XE#1939])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_threads@threads-cm-userptr-rebind.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1008] / [Intel XE#1201])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#1337])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#827]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][127] +5 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#361]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-dg2-set2:     [ABORT][130] -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-59.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1214]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-68.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - shard-adlp:         [FAIL][134] ([Intel XE#1069]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [ABORT][136] ([Intel XE#1939]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#1081]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#1214]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [INCOMPLETE][142] ([Intel XE#1195]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-userptr-split-binds-67108864:
    - shard-adlp:         [ABORT][144] ([Intel XE#1939]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_vm@large-userptr-split-binds-67108864.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-67108864.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][147] ([Intel XE#316]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#316]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][150] ([Intel XE#1231]) -> [DMESG-FAIL][151] ([Intel XE#324])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1124]) -> [SKIP][153] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][155] ([Intel XE#1124]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#619]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#619]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#787]) +27 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][161] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][162] -> [INCOMPLETE][163] ([Intel XE#1195]) +1 other test incomplete
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#787]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#373]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][171] ([Intel XE#373]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][173] ([Intel XE#307])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][174] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][175] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][176] ([Intel XE#1195]) -> [DMESG-WARN][177] ([Intel XE#1191] / [Intel XE#1214])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#282]) -> [DMESG-WARN][179] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][180] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][181] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][182] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][183] ([Intel XE#282] / [Intel XE#910])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][184] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][185] ([Intel XE#282])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][187] ([Intel XE#323])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#307]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#307])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#455]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][193] ([Intel XE#1137])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][195] ([Intel XE#1135])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_feature_discovery@psr2.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][196] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][197] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][198] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][199] ([Intel XE#1214] / [Intel XE#1608])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][200] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][201] ([Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][203] ([Intel XE#455]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][205] ([Intel XE#1195] / [Intel XE#927])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][207] ([Intel XE#651]) +9 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#651]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][210] ([Intel XE#1201]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#1210]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#653]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][215] ([Intel XE#653]) +8 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#498]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][221] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][223] ([Intel XE#498]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][225] ([Intel XE#1122])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][226] ([Intel XE#1204]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#734])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][229] ([Intel XE#929]) +7 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#929]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][232] ([Intel XE#1939]) -> [INCOMPLETE][233] ([Intel XE#1195]) +1 other test incomplete
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-9/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][234] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][235] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#756]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#756])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][239] ([Intel XE#756])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][241] ([Intel XE#1123])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1126]) -> [SKIP][243] ([Intel XE#1126] / [Intel XE#1201])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][245] ([Intel XE#288]) +8 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#288]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1192]) -> [SKIP][249] ([Intel XE#1192] / [Intel XE#1201])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         [SKIP][250] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][251] ([Intel XE#1201])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][252] ([Intel XE#1201] / [Intel XE#1948]) -> [SKIP][253] ([Intel XE#1201])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][254] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][255] ([Intel XE#1191] / [Intel XE#1214])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [INCOMPLETE][256] ([Intel XE#1195]) -> [DMESG-WARN][257] ([Intel XE#1214])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s3-mocs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][258] ([Intel XE#1162] / [Intel XE#1941]) -> [DMESG-WARN][259] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
    - shard-adlp:         [INCOMPLETE][260] ([Intel XE#1195]) -> [DMESG-WARN][261] ([Intel XE#1214] / [Intel XE#1941])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][262] ([Intel XE#1214]) -> [INCOMPLETE][263] ([Intel XE#1195] / [Intel XE#1358])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][264] ([Intel XE#1214]) -> [ABORT][265] ([Intel XE#1794])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [INCOMPLETE][266] ([Intel XE#1195] / [Intel XE#1349]) -> [DMESG-WARN][267] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1941])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#944]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#944])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-adlp:         [SKIP][270] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][271] ([Intel XE#1201])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][273] ([Intel XE#1201])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][274] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][275] ([Intel XE#1214] / [Intel XE#1760])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f -> xe-pw-134038v1

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f
  xe-pw-134038v1: 134038v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/index.html

--===============3570359661432086457==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Enable Priority Mem Read</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/134038/">https://patchwork.freedesktop.org/series/134038/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-134038v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-134038v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012=
e3d5d2f_full -&gt; xe-pw-134038v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1340=
38v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134038v1/shard-lnl-1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shar=
d-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-3/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1=
/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134=
038v1/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134038v1/shard-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-6/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-134038v1/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-134038v1/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-4/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl=
-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134038v1/shard-lnl-7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shar=
d-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-5/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1=
/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134=
038v1/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-2/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134038v1/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-lnl-2/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-134038v1/shard-lnl-1/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134038v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_chamelium_color@ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-sto=
rm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_co=
lor@deep-color@pipe-a-hdmi-a-6-gamma.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_co=
lor@deep-color@pipe-a-hdmi-a-6-gamma.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) +4 other=
 tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspen=
d@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x12=
8-right-edge.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#=
282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/91=
0">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs=
-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309<=
/a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cu=
rsor_legacy@torture-bo@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_cursor_le=
gacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cu=
rsor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-464/igt@kms_cursor_=
legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +=
1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_flip@2x-absolute-wf_vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-=
hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_fli=
p@plain-flip-fb-recreate@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@kms_flip@=
plain-flip-fb-recreate@b-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 othe=
r test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_fl=
ip@plain-flip-fb-recreate@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_fli=
p@plain-flip-fb-recreate@b-hdmi-a6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32=
bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +31 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 oth=
er test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_pipe_crc_basic@nonblock=
ing-crc-frame-sequence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-=
read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_plane@plane-panning-bott=
om-right-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +8 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_plane_scaling@intel-max-=
src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">In=
tel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">=
Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@kms_prop_blob@blob-prop-val=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_psr2_sf@primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-=
rotation.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1874">Intel XE#1874</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pi=
pe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1939">Intel XE#1939</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_writeback@writeback-chec=
k-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-l=
arge.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-466/igt@xe_evict@evict-mixed-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_evict@evict-small-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_evi=
ct@evict-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-433/igt@xe_evict@evict-threa=
ds-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_evict@evict-threads-large=
-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"=
>Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-pref=
etch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel X=
E#288</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_reset@gt-reset-stre=
ss.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_exec_reset@gt-reset-stres=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@xe_exe=
c_threads@threads-bal-mixed-userptr.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-464/igt@xe_exec=
_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1=
238</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_exec_threads@threads-cm-=
userptr-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_query@multigpu-query-hwco=
nfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_as=
ync_flips@alternate-sync-async-flip@pipe-b-dp-4.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/s=
hard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@kms_async_flips@async-fli=
p-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Inte=
l XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/910">Intel XE#910</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-134038v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_cu=
rsor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038=
v1/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-=
dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm=
_rpm@universal-planes@plane-59.html">ABORT</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_pm_rpm@=
universal-planes@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm=
_rpm@universal-planes@plane-68.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-=
463/igt@kms_pm_rpm@universal-planes@plane-68.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_exec=
_balancer@twice-cm-virtual-userptr-invalidate.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/s=
hard-adlp-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1939">Intel XE#1939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-134038v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execq=
ueues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/sh=
ard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@s=
4-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_pm@s4-ba=
sic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@xe_pm@=
s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-67108864:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_vm@l=
arge-userptr-split-binds-67108864.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6=
/igt@xe_vm@large-userptr-split-binds-67108864.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_bi=
g_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-d=
g2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134038v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
38v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cc=
s@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mt=
l-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cc=
s@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-cc=
s@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038=
v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pi=
pe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-134038v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mt=
l-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/=
shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ch=
amelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-d=
g2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/=
igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/=
shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel X=
E#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-=
adlp-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Inte=
l XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/sh=
ard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191=
">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cu=
rsor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-4=
63/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">=
Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Inte=
l XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134038v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-ato=
mic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_cursor_lega=
cy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#2=
82</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/910=
">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/282">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Int=
el XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134038v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cu=
rsor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_di=
splay_modes@mst-extended-mode-negative.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-=
436/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"=
>Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-=
432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-43=
2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hd=
mi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1608">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-inte=
rruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
38v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">=
Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-p=
rimscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134038v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038=
v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"=
>Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134038v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
498">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-134038v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-f=
actor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#4=
98</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/498">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-432/igt@kms_plane_scaling@=
plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Inte=
l XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg=
2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_pm_dc@dc9-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134038v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@kms_psr@psr-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_vbl=
ank@query-forked-hang@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-ad=
lp-9/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel=
 XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1=
034</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
95">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-134038v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-susp=
end@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_wr=
iteback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-=
dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038=
v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">In=
tel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/sh=
ard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#112=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">=
Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-134038v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-=
dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_liv=
e_ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_live_kt=
est@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@d=
3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@=
xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-8/igt@x=
e_pm@d3hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s=
2idle-exec-after.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
38v1/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s=
3-mocs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-2/igt@xe_pm@s3-mocs.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_pm@=
s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard=
-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Inte=
l XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1941">Intel XE#1941</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s=
3-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-6/igt@xe_=
pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s=
4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-1/igt@xe_pm=
@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-adlp-9/igt@xe_pm=
@s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm_r=
esidency@gt-c6-freeze.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard=
-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Inte=
l XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_que=
ry@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/shard-dg2-436/igt@xe_q=
uery@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_quer=
y@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13403=
8v1/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_que=
ry@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
38v1/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel =
XE#1760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-134038v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f -&gt; xe-pw-134=
038v1</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 573842e9ab57ccd8d6bb68a=
d55ed2e012e3d5d2f<br />
  xe-pw-134038v1: 134038v1</p>

</body>
</html>

--===============3570359661432086457==--
