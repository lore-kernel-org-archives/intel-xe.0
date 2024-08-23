Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097DAC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 14:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9210E047;
	Fri, 23 Aug 2024 14:29:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFD710E047;
 Fri, 23 Aug 2024 14:29:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8599850611787875307=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915=3A_Implement_Dbuf_over?=
 =?utf-8?q?lap_detection_feature_starting_from_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 14:29:04 -0000
Message-ID: <172442334482.746160.13258463658900103356@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823062409.274179-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240823062409.274179-1-vinod.govindapillai@intel.com>
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

--===============8599850611787875307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Implement Dbuf overlap detection feature starting from LNL
URL   : https://patchwork.freedesktop.org/series/137686/
State : failure

== Summary ==

CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full -> xe-pw-137686v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137686v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137686v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137686v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-lnl:          ([PASS][1], [PASS][2]) -> [INCOMPLETE][3] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_psr@psr2-suspend@edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          ([PASS][4], [PASS][5]) -> [FAIL][6]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@xe_pm@s3-mocs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - {shard-bmg}:        ([PASS][9], [PASS][10]) -> [FAIL][11] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-panning:
    - {shard-bmg}:        ([PASS][12], [PASS][13]) -> [INCOMPLETE][14] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_flip@flip-vs-panning.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_flip@flip-vs-panning.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-6/igt@kms_flip@flip-vs-panning.html

  
Known issues
------------

  Here are the changes found in xe-pw-137686v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#911]) +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         ([PASS][17], [PASS][18]) -> [FAIL][19] ([Intel XE#1426]) +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          ([PASS][20], [PASS][21]) -> [FAIL][22] ([Intel XE#1426]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     ([PASS][24], [PASS][25]) -> [DMESG-WARN][26] ([Intel XE#877])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([PASS][28], [PASS][29]) -> [FAIL][30] ([Intel XE#1231])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][31], [PASS][32]) -> [FAIL][33] ([Intel XE#1204]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +13 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#308])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-adlp:         ([PASS][47], [PASS][48]) -> [INCOMPLETE][49] ([Intel XE#1195]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     ([PASS][50], [PASS][51]) -> [INCOMPLETE][52] ([Intel XE#1195])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1137] / [Intel XE#1201])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [i915#5274])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#651]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         ([PASS][57], [PASS][58]) -> [FAIL][59] ([Intel XE#1861]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#1861])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#658])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#653]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          ([PASS][66], [PASS][67]) -> [DMESG-WARN][68] ([Intel XE#324]) +3 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#616]) +3 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#327])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         ([PASS][76], [PASS][77]) -> [FAIL][78] ([Intel XE#771] / [Intel XE#899])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         ([PASS][79], [PASS][80]) -> [FAIL][81] ([Intel XE#899])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2019]) +5 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-idle:
    - shard-adlp:         ([PASS][84], [PASS][85]) -> [SKIP][86] ([Intel XE#1201]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_vblank@wait-idle.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#1050])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1123])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     ([PASS][90], [PASS][91]) -> [FAIL][92] ([Intel XE#1600])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][93] ([Intel XE#1473])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-rebind:
    - shard-adlp:         ([PASS][94], [PASS][95]) -> [DMESG-WARN][96] ([Intel XE#2226]) +7 other tests dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-rebind.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@many-parallel-userptr-rebind.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@xe_exec_balancer@many-parallel-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#288]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     ([PASS][99], [PASS][100]) -> [TIMEOUT][101] ([Intel XE#2105])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-basic:
    - shard-adlp:         [PASS][102] -> [DMESG-WARN][103] ([Intel XE#2226])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][104] -> [DMESG-WARN][105] ([Intel XE#1727] / [Intel XE#2226])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#2229])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          ([PASS][108], [PASS][109]) -> [FAIL][110] ([Intel XE#2249])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#2249])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          ([PASS][113], [PASS][114]) -> [FAIL][115] ([Intel XE#2514])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2514])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#977])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     ([PASS][119], [PASS][120]) -> [DMESG-WARN][121] ([Intel XE#1551] / [Intel XE#569])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][122] -> [DMESG-WARN][123] ([Intel XE#569])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][124] -> [ABORT][125] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][126] -> [ABORT][127] ([Intel XE#1358] / [Intel XE#1607])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         ([PASS][129], [PASS][130]) -> [FAIL][131] ([Intel XE#1081])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([DMESG-WARN][132], [PASS][133]) ([Intel XE#1033]) -> [PASS][134]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          ([FAIL][135], [PASS][136]) ([Intel XE#1701]) -> [PASS][137] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          ([FAIL][138], [FAIL][139]) ([Intel XE#1426]) -> [PASS][140] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        ([FAIL][141], [PASS][142]) ([Intel XE#1426]) -> [PASS][143] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][144], [FAIL][145]) ([Intel XE#1426]) -> [PASS][146] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - {shard-bmg}:        ([INCOMPLETE][147], [PASS][148]) -> [PASS][149]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          ([FAIL][150], [FAIL][151]) ([Intel XE#1659]) -> [PASS][152]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         ([FAIL][153], [FAIL][154]) ([Intel XE#1874]) -> [PASS][155] +10 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         ([FAIL][156], [DMESG-FAIL][157]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][158] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     ([PASS][159], [DMESG-WARN][160]) ([Intel XE#877]) -> [PASS][161] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:
    - {shard-bmg}:        ([DMESG-WARN][162], [PASS][163]) ([Intel XE#877]) -> [PASS][164] +4 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - {shard-bmg}:        ([DMESG-WARN][165], [DMESG-WARN][166]) ([Intel XE#877]) -> [PASS][167] +2 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][168] ([Intel XE#877]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          ([FAIL][170], [PASS][171]) ([Intel XE#886]) -> [PASS][172] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         ([PASS][173], [FAIL][174]) ([Intel XE#1874]) -> [PASS][175] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         ([FAIL][176], [FAIL][177]) ([Intel XE#1861]) -> [PASS][178]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][179] ([Intel XE#1861]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        ([PASS][181], [SKIP][182]) ([Intel XE#1503]) -> [PASS][183]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          ([DMESG-FAIL][184], [DMESG-FAIL][185]) ([Intel XE#324]) -> [PASS][186]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          ([DMESG-FAIL][187], [PASS][188]) ([Intel XE#324]) -> [PASS][189] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          ([DMESG-WARN][190], [PASS][191]) ([Intel XE#324]) -> [PASS][192] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:
    - {shard-bmg}:        [INCOMPLETE][193] -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [FAIL][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@kms_pm_rpm@i2c.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#899]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          ([FAIL][199], [FAIL][200]) ([Intel XE#2443]) -> [PASS][201] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr@max-min.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr@max-min.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-7/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - {shard-bmg}:        ([INCOMPLETE][202], [PASS][203]) ([Intel XE#1473]) -> [PASS][204]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - {shard-bmg}:        ([FAIL][205], [FAIL][206]) ([Intel XE#2364]) -> [PASS][207]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        ([TIMEOUT][208], [PASS][209]) ([Intel XE#1473]) -> [PASS][210]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][211] ([Intel XE#1473]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     ([TIMEOUT][213], [TIMEOUT][214]) ([Intel XE#1473]) -> [PASS][215]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][216] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-threads-large.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-adlp:         ([DMESG-FAIL][218], [DMESG-FAIL][219]) ([Intel XE#1638]) -> [PASS][220]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-rebind:
    - shard-adlp:         ([DMESG-WARN][221], [DMESG-WARN][222]) ([Intel XE#2226]) -> [PASS][223] +4 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@xe_exec_basic@many-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-lnl:          ([PASS][226], [ABORT][227]) ([Intel XE#2317]) -> [PASS][228]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_module_load@reload.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_module_load@reload.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-6/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     ([DMESG-WARN][229], [DMESG-WARN][230]) ([Intel XE#2019]) -> [PASS][231]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          ([PASS][232], [ABORT][233]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][234]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         ([ABORT][235], [PASS][236]) ([Intel XE#1794]) -> [PASS][237]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][238] ([Intel XE#2019]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          ([PASS][240], [ABORT][241]) ([Intel XE#1794]) -> [PASS][242]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][243], [FAIL][244]) ([Intel XE#958]) -> [PASS][245]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         ([FAIL][246], [FAIL][247]) ([Intel XE#1081]) -> [PASS][248]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     ([SKIP][249], [SKIP][250]) ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][251] ([Intel XE#623])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         ([PASS][252], [DMESG-WARN][253]) ([Intel XE#1033]) -> [DMESG-WARN][254] ([Intel XE#1033])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#873]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#873])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#316]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([SKIP][259], [SKIP][260]) ([Intel XE#1201]) -> [SKIP][261] ([Intel XE#1124] / [Intel XE#1201])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][262], [SKIP][263]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][264] ([Intel XE#316]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         ([FAIL][265], [FAIL][266]) ([Intel XE#1204]) -> [DMESG-FAIL][267] ([Intel XE#324])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][269] ([Intel XE#1124]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#610]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#610])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][272] ([Intel XE#1231]) -> [DMESG-FAIL][273] ([Intel XE#324])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         ([FAIL][274], [FAIL][275]) ([Intel XE#1231]) -> [DMESG-FAIL][276] ([Intel XE#324])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][277] ([Intel XE#1242]) -> [DMESG-FAIL][278] ([Intel XE#324])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124]) -> [SKIP][280] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][282] ([Intel XE#607])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     ([SKIP][283], [SKIP][284]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][285] ([Intel XE#1124]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     ([SKIP][286], [SKIP][287]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][288] ([Intel XE#367]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#367]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2191]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     ([SKIP][293], [SKIP][294]) ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][295] ([Intel XE#2191]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][297] ([Intel XE#367])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#787]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][305] ([Intel XE#787]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][306], [SKIP][307]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][308] ([Intel XE#787]) +55 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     ([SKIP][309], [SKIP][310]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][311] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     ([SKIP][312], [SKIP][313]) ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][314] ([Intel XE#314])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#373]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     ([SKIP][317], [SKIP][318]) ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][319] ([Intel XE#306])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     ([SKIP][320], [SKIP][321]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][322] ([Intel XE#373]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][324] ([Intel XE#373]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#307]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#307])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#308]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#308])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][330] ([Intel XE#308]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#323]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#323])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][333] ([i915#3804]) -> [SKIP][334] ([Intel XE#1201] / [i915#3804])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][336] ([Intel XE#455]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     ([SKIP][337], [SKIP][338]) ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][339] ([Intel XE#1135])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_feature_discovery@psr2.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     ([SKIP][340], [SKIP][341]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][342] ([Intel XE#455]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         ([PASS][343], [FAIL][344]) ([Intel XE#1874]) -> [FAIL][345] ([Intel XE#1874]) +2 other tests fail
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         ([SKIP][346], [SKIP][347]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][348] ([Intel XE#1201])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         ([FAIL][349], [FAIL][350]) -> [SKIP][351] ([Intel XE#1201] / [Intel XE#651])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     ([SKIP][352], [SKIP][353]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][354] ([Intel XE#651]) +13 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#651]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     ([SKIP][357], [SKIP][358]) ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][359] ([Intel XE#658])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][360] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][361] ([Intel XE#1201])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][363] ([Intel XE#651]) +10 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#653]) -> [SKIP][365] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         ([SKIP][366], [SKIP][367]) ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][368] ([Intel XE#1201]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     ([SKIP][369], [SKIP][370]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][371] ([Intel XE#653]) +17 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][373] ([Intel XE#653]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#605]) -> [SKIP][375] ([Intel XE#1201] / [Intel XE#605])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-adlp:         ([SKIP][376], [SKIP][377]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][378] ([Intel XE#1201])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     ([PASS][379], [DMESG-WARN][380]) ([Intel XE#1551]) -> [DMESG-WARN][381] ([Intel XE#1551]) +1 other test dmesg-warn
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          ([DMESG-WARN][382], [PASS][383]) ([Intel XE#324]) -> [DMESG-WARN][384] ([Intel XE#324]) +1 other test dmesg-warn
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2318]) -> [SKIP][388] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][389], [SKIP][390]) ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][391] ([Intel XE#2318]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][392], [SKIP][393]) ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][394] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][396] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][398] ([Intel XE#2318]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][400] ([Intel XE#870]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1129]) -> [SKIP][402] ([Intel XE#1129] / [Intel XE#1201]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          ([PASS][403], [FAIL][404]) ([Intel XE#1430]) -> [FAIL][405] ([Intel XE#1430])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][407] ([Intel XE#1489])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     ([SKIP][408], [SKIP][409]) ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][410] ([Intel XE#1489]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1489]) -> [SKIP][412] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][414] ([Intel XE#929]) +6 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#929]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     ([SKIP][417], [SKIP][418]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][419] ([Intel XE#929]) +6 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     ([SKIP][420], [SKIP][421]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][422] ([Intel XE#327])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1127]) -> [SKIP][424] ([Intel XE#1127] / [Intel XE#1201])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         ([SKIP][425], [SKIP][426]) ([Intel XE#1201]) -> [SKIP][427] ([Intel XE#1201] / [Intel XE#327])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#455]) -> [SKIP][429] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][430], [SKIP][431]) ([Intel XE#1201] / [Intel XE#1500] / [Intel XE#362]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#1500])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     ([SKIP][433], [SKIP][434]) ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][435] ([Intel XE#756]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#756]) -> [SKIP][437] ([Intel XE#1201] / [Intel XE#756])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1126]) -> [SKIP][439] ([Intel XE#1126] / [Intel XE#1201])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][441] ([Intel XE#1126])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][443] ([Intel XE#944])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][444] ([Intel XE#1041] / [Intel XE#1473]) -> [INCOMPLETE][445] ([Intel XE#1195] / [Intel XE#1473])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#288]) -> [SKIP][447] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     ([SKIP][448], [SKIP][449]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][450] ([Intel XE#288]) +8 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][452] ([Intel XE#288]) +9 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#512]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#512])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mmap@small-bar.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         ([TIMEOUT][455], [TIMEOUT][456]) ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][457] ([Intel XE#2026])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_module_load@many-reload.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_module_load@many-reload.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@xe_module_load@many-reload.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#2541]) -> [SKIP][459] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][461] ([Intel XE#2541])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@missing-sample-flags.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     ([SKIP][462], [SKIP][463]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][464] ([Intel XE#2541]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_oa@rc6-disable.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_oa@rc6-disable.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1337]) -> [SKIP][466] ([Intel XE#1201] / [Intel XE#1337])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     ([SKIP][467], [SKIP][468]) ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][469] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][471] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     ([SKIP][472], [SKIP][473]) ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][474] ([Intel XE#2284])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     ([DMESG-WARN][475], [DMESG-WARN][476]) ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569]) -> [DMESG-WARN][477] ([Intel XE#1162] / [Intel XE#569])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#579]) -> [SKIP][479] ([Intel XE#1201] / [Intel XE#579])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     ([SKIP][480], [SKIP][481]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][482] ([Intel XE#944])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#944]) -> [SKIP][484] ([Intel XE#1201] / [Intel XE#944])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          ([DMESG-WARN][485], [DMESG-WARN][486]) ([Intel XE#1760]) -> [DMESG-FAIL][487] ([Intel XE#1760])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7986 -> IGT_7987
  * Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -> xe-pw-137686v1

  IGT_7986: 7986
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70
  xe-pw-137686v1: 137686v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/index.html

--===============8599850611787875307==
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
<tr><td><b>Series:</b></td><td>drm/i915: Implement Dbuf overlap detection f=
eature starting from LNL</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137686/">https://patchwork.freedesktop.org/series/137686/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137686v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137686v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70_full -&gt; xe-pw-137686v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137686v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137686v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1376=
86v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_psr=
@psr2-suspend@edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/=
igt@kms_psr@psr2-suspend@edp-1.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_psr@psr2-=
suspend@edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_gt_f=
req@freq_reset_multiple.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-ln=
l-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@xe_gt=
_freq@freq_reset_multiple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@=
s3-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137686v1/shard-dg2-436/igt@xe_pm@s3-mocs.html">DMESG-WARN</a><=
/li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tile=
d-bmg-ccs@pipe-a-dp-2.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-8/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_fli=
p@flip-vs-panning.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/ig=
t@kms_flip@flip-vs-panning.html">PASS</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-6/igt@kms_flip@flip-vs-=
panning.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137686v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/=
shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp=
-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_at=
omic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_a=
tomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Int=
el XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38e=
e0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-tog=
gle-modeset-transition@pipe-a-edp-1.html">PASS</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel =
XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_b=
ig_fb@linear-64bpp-rotate-0.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shar=
d-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466=
/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_big_fb@x-tiled-ma=
x-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee=
0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip-async-flip.html">PASS</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_big_f=
b@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#=
1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-=
yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid=
-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cu=
rsor_edge_walk@128x128-top-edge.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/=
shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard=
-adlp-4/igt@kms_cursor_edge_walk@128x128-top-edge.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#=
1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_c=
ursor_legacy@cursor-vs-flip-varying-size.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774=
a8efbd70/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.ht=
ml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137686v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_force_connector_basic@p=
rune-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_fr=
ontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb=
65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offs=
cren-pri-shrfb-draw-blt.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_frontbuffer_tra=
cking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp=
-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">=
Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pla=
ne@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e57=
74a8efbd70/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-=
3.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-137686v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-=
plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_un=
iversal_plane@cursor-fb-leak.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-=
9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e=
5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdm=
i-a-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137686v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pi=
pe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_vblank@ts-=
continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +5 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vb=
lank@wait-idle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@=
kms_vblank@wait-idle.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_vblank@wait-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_compute@ccs-mode-basic.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ev=
ict@evict-beng-large-multi-vm-cm.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sha=
rd-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#160=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@xe_evict@evict-threads-larg=
e.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-rebind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exe=
c_balancer@many-parallel-userptr-rebind.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-adlp-8/igt@xe_exec_balancer@many-parallel-userptr-rebind.html=
">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137686v1/shard-adlp-4/igt@xe_exec_balancer@many-parallel-userptr-rebind.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2226">Intel XE#2226</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ex=
ec_reset@parallel-gt-reset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard=
-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/=
igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec=
_threads@threads-bal-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@xe_exec_threads@t=
hreads-bal-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_f=
req@freq_fixed_exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_ex=
ec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@m=
mio-triggered-reports.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-=
3/igt@xe_oa@mmio-triggered-reports.html">PASS</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@xe_oa@mmi=
o-triggered-reports.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mm=
io-triggered-reports@ccs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-5/igt@xe_oa@mmio-trigger=
ed-reports@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@o=
a-regs-whitelisted.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/i=
gt@xe_oa@oa-regs-whitelisted.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_oa@oa-regs-w=
hitelisted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa=
-regs-whitelisted@rcs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_oa@oa-regs-whiteli=
sted@rcs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm=
@s3-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435=
/igt@xe_pm@s3-multiple-execs.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@xe_pm@s3-mult=
iple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefet=
ch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-137686v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_query@multigpu-query-inv=
alid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spi=
n_batch@spin-fixed-duration.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shar=
d-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/=
igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d6=
72ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-f=
lip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sh=
ard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_ato=
mic_transition@modeset-transition-nonblocking.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359=
e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonb=
locking.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1701">Intel XE#1701</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_atomic_transition@=
modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-=
7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transit=
ion@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">In=
tel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137686v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-tra=
nsition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0ea=
bb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-mod=
eset-transition@pipe-a-dp-2.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-6/igt@km=
s_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_a=
tomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab3=
8ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane=
-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-=
dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-=
a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big=
_fb@4-tiled-16bpp-rotate-180.html">INCOMPLETE</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd=
70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard=
-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd=
359e5774a8efbd70/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rot=
ate-180-hflip.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-3/igt@kms_big_fb@4-til=
ed-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard=
-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/s=
hard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +10 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel X=
E#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137686v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_c=
ursor_legacy@torture-move@pipe-b.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">In=
tel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-137686v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_fli=
p@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb=
65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modes=
et@bd-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-7/igt@kms_flip@2x-fl=
ip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html">PASS</a> +4 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_fli=
p@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774=
a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DM=
ESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137686v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interr=
uptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@=
ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-137686v1/shard-bmg-5/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_fli=
p@wf_vblank-ts-check@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shar=
d-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/s=
hard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pip=
e-c-hdmi-a-1-x-to-x.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_flip_=
tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_fr=
ontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0=
eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-9/i=
gt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip=
-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr=
@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms=
_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg-7/igt@kms_hdr@inval=
id-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pla=
ne@plane-position-hole.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_pla=
ne@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5=
774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe=
-a-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_pla=
ne@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5=
774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137686v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe=
-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-d=
p-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137686v1/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-f=
actor-0-5@pipe-b-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm=
_rpm@i2c.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137686v1/shard-dg2-433/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shar=
d-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr=
@max-min.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr=
@max-min.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-7/igt@kms_vrr@max-min.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evic=
t@evict-beng-cm-threads-large.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efb=
d70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel X=
E#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137686v1/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evic=
t@evict-beng-large-multi-vm-cm.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/s=
hard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#23=
64</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7686v1/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evic=
t@evict-beng-mixed-threads-large.html">TIMEOUT</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efb=
d70/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Inte=
l XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-137686v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_evi=
ct@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/=
igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_ev=
ict@evict-cm-threads-large.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sh=
ard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict=
@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-bmg=
-4/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exe=
c_balancer@many-parallel-userptr-invalidate.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr=
-invalidate.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@xe_exec_bal=
ancer@many-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exe=
c_basic@many-rebind.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-=
adlp-1/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sha=
rd-adlp-8/igt@xe_exec_basic@many-rebind.html">PASS</a> +4 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_liv=
e_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@x=
e_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_modu=
le_load@reload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@x=
e_module_load@reload.html">ABORT</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-6/igt@xe_modul=
e_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mo=
dule_load@reload-no-display.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd7=
0/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel=
 XE#2019</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137686v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s=
4-exec-after.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_=
pm@s4-exec-after.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-1/ig=
t@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@=
s4-mocs.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@=
s4-mocs.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@xe_pm@s4-mocs.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@=
s4-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_pm=
@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2=
/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-7/=
igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_r=
esidency@toggle-gt-c6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-=
3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-4/i=
gt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spi=
n_batch@spin-fixed-duration-with-preempter.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e57=
74a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempte=
r.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1081">Intel XE#1081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-du=
ration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_a=
ddfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/623">Intel XE#623</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_addfb_basic@addf=
b25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sh=
ard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi=
-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@km=
s_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@k=
ms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@kms_big=
_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_b=
ig_fb@linear-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-137686v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
6">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eab=
b65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-async-flip.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-1/igt@kms=
_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shar=
d-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#=
610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel X=
E#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137686v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eab=
b65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64=
bpp-rotate-180-async-flip.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-2/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel=
 XE#1242</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137686v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#60=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_b=
ig_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
686v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hf=
lip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_b=
w@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd3=
59e5774a8efbd70/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_=
bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sh=
ard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_b=
w@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd3=
59e5774a8efbd70/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@km=
s_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">In=
tel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@crc-primary=
-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_c=
cs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672a=
b38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@crc-sprite-planes=
-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137686v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-m=
c-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_ccs@=
random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_c=
dclk@mode-transition-all-outputs.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/314">Intel XE#314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outp=
uts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_cham=
elium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_c=
hamelium_color@ctm-blue-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/s=
hard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
">Intel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_c=
hamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e57=
74a8efbd70/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-format=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_chamelium_=
frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/=
igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel X=
E#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13768=
6v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"=
>Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
686v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-var=
ying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shar=
d-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@km=
s_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_f=
eature_discovery@psr2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-=
432/igt@kms_feature_discovery@psr2.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_f=
lip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mod=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1=
817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_sca=
led_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_flip_scaled_crc@f=
lip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pip=
e-b-hdmi-a-1-y-to-y.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-8/igt@kms_flip_=
tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a=
>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eab=
b65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-ad=
lp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0e=
abb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-spr-indfb-fullscreen.html">FAIL</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-adlp-6/igt@kms_frontbuff=
er_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">=
Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-43=
2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">In=
tel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard=
-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@fbc-tiling-y.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/658">Intel XE#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137686v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0=
eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sh=
ard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_f=
rontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-prim=
scrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-43=
2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">In=
tel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-436/igt@kms_getfb@=
getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hd=
r@static-toggle-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-ad=
lp-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-adlp-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_p=
lane@plane-panning-bottom-right-suspend.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1551">Intel XE#1551</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_plane@plane-panning-bo=
ttom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_pla=
ne@plane-position-covered.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/=
shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2=
318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-137686v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel X=
E#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7=
365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7=
365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel=
 XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
18">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@plane=
s-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_plane_scaling@p=
lanes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel X=
E#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2=
-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_=
pm_dc@dc6-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-lnl-8/igt@kms_pm_dc@dc6-d=
pms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ps=
r2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"=
>Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_p=
sr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e577=
4a8efbd70/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_psr2_sf@ov=
erlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ps=
r2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg=
2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ps=
r@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@k=
ms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@kms_p=
sr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_p=
sr@psr-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@km=
s_psr@psr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@k=
ms_psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_r=
otation_crc@primary-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/=
shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
27">Intel XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-=
dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel =
XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sh=
ard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_sc=
aling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@k=
ms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd35=
9e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-=
chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-=
434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_w=
riteback@writeback-invalid-parameters.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8e=
fbd70/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@kms_writeback@writeback-=
invalid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt=
@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sha=
rd-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_cre=
ate@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/sh=
ard-dg2-432/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#94=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evi=
ct@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
86v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
95">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exe=
c_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg=
2-434/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ex=
ec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5=
774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-r=
ace.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_exec_faul=
t_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686=
v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_mod=
ule_load@many-reload.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-ad=
lp-8/igt@xe_module_load@many-reload.html">TIMEOUT</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#19=
61</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/202=
6">Intel XE#2026</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137686v1/shard-adlp-6/igt@xe_module_load@many-reload.html">TIME=
OUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/202=
6">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@=
invalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_oa@in=
valid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-43=
2/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_oa=
@rc6-disable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@x=
e_oa@rc6-disable.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/=
igt@xe_oa@rc6-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-433/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm=
@d3cold-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466=
/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE=
#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137686v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-466/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm=
@d3cold-mocs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@x=
e_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/=
igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm=
@s3-vm-bind-unbind-all.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941"=
>Intel XE#1941</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137686v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-al=
l.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard-dg2-435/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-invalid-cs-cycles.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8ef=
bd70/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137686v1/shard-dg2-432/igt@xe_query@multigpu-query-in=
valid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_que=
ry@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137686v1/shard=
-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/s=
hard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#17=
60</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7686v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Inte=
l XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7986 -&gt; IGT_7987</li>
<li>Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -&gt; xe-pw-137=
686v1</li>
</ul>
<p>IGT_7986: 7986<br />
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fc=
d359e5774a8efbd70<br />
  xe-pw-137686v1: 137686v1</p>

</body>
</html>

--===============8599850611787875307==--
