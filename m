Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE1C27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 20:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96710E292;
	Sun,  9 Jun 2024 20:32:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04F010E292;
 Sun,  9 Jun 2024 20:32:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1349969370854248914=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Few_GuC_PC_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Jun 2024 20:32:17 -0000
Message-ID: <171796513762.29880.14740345980701625677@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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

--===============1349969370854248914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Few GuC PC improvements
URL   : https://patchwork.freedesktop.org/series/134654/
State : failure

== Summary ==

CI Bug Log - changes from xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037_full -> xe-pw-134654v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134654v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134654v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134654v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-FAIL][4] ([Intel XE#1608]) -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [INCOMPLETE][6] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][8] ([Intel XE#1214]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - {shard-lnl}:        [SKIP][10] ([Intel XE#656]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_psr:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-4/igt@kms_psr.html

  * igt@kms_sequence@queue-busy@pipe-b-edp-1:
    - {shard-lnl}:        [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-2/igt@kms_sequence@queue-busy@pipe-b-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-3/igt@kms_sequence@queue-busy@pipe-b-edp-1.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - {shard-lnl}:        [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate:
    - {shard-lnl}:        [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-5/igt@xe_exec_threads@threads-fd-userptr-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-6/igt@xe_exec_threads@threads-fd-userptr-invalidate.html

  
New tests
---------

  New tests have been introduced between xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037_full and xe-pw-134654v1_full:

### New IGT tests (2) ###

  * igt@kms_tiled_display@basic-test-pattern:
    - Statuses : 1 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.86] s

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-134654v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#324])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1874]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1242])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#1252])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#314]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455]) +22 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#308])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][40] ([Intel XE#1608]) +3 other tests dmesg-fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#282] / [Intel XE#910])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][46] ([Intel XE#1214] / [Intel XE#282])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@forked-bo@pipe-a:
    - shard-dg2-set2:     [PASS][47] -> [DMESG-WARN][48] ([Intel XE#282])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@pipe-a.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#701])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1135] / [Intel XE#1201])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1195]) +3 other tests incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#1861])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1151] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#656]) +37 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1339])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#455])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#616])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][69] ([Intel XE#1551]) +1 other test dmesg-fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#616]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][72] ([Intel XE#361]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#361])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1122] / [Intel XE#1201])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1129] / [Intel XE#1201])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1211])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#929])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#327])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium (NEW):
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#362])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#771] / [Intel XE#899])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][93] -> [FAIL][94] ([Intel XE#899])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#1932])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1126] / [Intel XE#1201])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][101] -> [FAIL][102] ([Intel XE#1600])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#1392]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#288])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#288]) +28 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#1081])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][111] ([Intel XE#1214] / [Intel XE#1975])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#378])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_module_load@force-load.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1061] / [Intel XE#1201])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#366])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         NOTRUN -> [FAIL][115] ([Intel XE#1924]) +3 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][116] -> [ABORT][117] ([Intel XE#1358] / [Intel XE#1794])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][118] -> [DMESG-WARN][119] ([Intel XE#1214])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][120] -> [INCOMPLETE][121] ([Intel XE#1195] / [Intel XE#1358])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][124] ([Intel XE#1214] / [Intel XE#1760])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - {shard-lnl}:        [FAIL][125] ([Intel XE#1659]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][127] ([Intel XE#1214]) -> [PASS][128] +3 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195]) -> [PASS][130] +2 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][134] +4 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#282] / [Intel XE#910]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][137] ([Intel XE#361]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#1600]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_live_ktest@xe_migrate:
    - {shard-lnl}:        [SKIP][141] ([Intel XE#1192]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-multiple-execs:
    - {shard-lnl}:        [ABORT][143] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][145] ([Intel XE#1794]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - {shard-lnl}:        [FAIL][147] -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][150] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][152] ([Intel XE#801]) +23 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][154] ([Intel XE#316])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#316]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#316])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][157] ([Intel XE#1231]) -> [FAIL][158] ([Intel XE#1242])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][160] ([Intel XE#607])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1124]) -> [SKIP][162] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][164] ([Intel XE#1124]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][166] ([Intel XE#619])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#367]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#367])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][170] ([Intel XE#367]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#787]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][174] ([Intel XE#787]) +41 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][176] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][178] ([Intel XE#1252]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][182] ([Intel XE#1152]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][184] ([Intel XE#306]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#306]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#306])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][188] ([Intel XE#373]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#373]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#307]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#307])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][194] ([Intel XE#308]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#308]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#308])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][197] ([Intel XE#282]) -> [DMESG-WARN][198] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][200] ([Intel XE#1214] / [Intel XE#282])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][201] ([Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][202] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][203] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][204] ([Intel XE#282]) +5 other tests dmesg-warn
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][206] ([Intel XE#323])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][208] ([Intel XE#307])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#455]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][211] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][212] ([Intel XE#1608])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#703]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#703])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][216] ([Intel XE#1137])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][218] ([Intel XE#1135])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-FAIL][219] ([Intel XE#1608] / [Intel XE#2034]) -> [INCOMPLETE][220] ([Intel XE#1195] / [Intel XE#927])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][221] ([Intel XE#1551]) -> [INCOMPLETE][222] ([Intel XE#1195] / [Intel XE#1551])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][223] ([Intel XE#1551]) -> [DMESG-WARN][224] ([Intel XE#1214] / [Intel XE#1551])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][226] ([Intel XE#455]) +14 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [i915#5274]) -> [SKIP][228] ([i915#5274])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#651]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][232] ([Intel XE#651]) +19 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#653]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][236] ([Intel XE#653]) +21 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][238] ([Intel XE#417])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#356]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#356])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#305]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#908]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#908])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][248] ([Intel XE#908])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#929]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][252] ([Intel XE#929]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1127]) -> [SKIP][254] ([Intel XE#1127] / [Intel XE#1201])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#327]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][258] ([Intel XE#327]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][259] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-FAIL][260] ([Intel XE#1608]) +1 other test dmesg-fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][262] ([Intel XE#756])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_writeback@writeback-check-output.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#756]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#756])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1091])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][270] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1123]) -> [SKIP][272] ([Intel XE#1123] / [Intel XE#1201])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1126]) -> [SKIP][274] ([Intel XE#1126] / [Intel XE#1201])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][276] ([Intel XE#288]) +15 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#288]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][279] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-FAIL][280] ([Intel XE#1608] / [Intel XE#2034])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][281] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][282] ([Intel XE#1551])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][284] ([Intel XE#366])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [INCOMPLETE][285] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-FAIL][286] ([Intel XE#1608])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s3-exec-after.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [DMESG-FAIL][287] ([Intel XE#1608]) -> [INCOMPLETE][288] ([Intel XE#1195]) +1 other test incomplete
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-2/igt@xe_pm@s3-mocs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [DMESG-FAIL][289] -> [INCOMPLETE][290] ([Intel XE#1195])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#366]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#366])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [INCOMPLETE][293] ([Intel XE#1195]) -> [DMESG-WARN][294] ([Intel XE#1214])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#579]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#579])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][298] ([Intel XE#944])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_query@multigpu-query-config.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_vm@large-split-binds-16777216:
    - shard-dg2-set2:     [INCOMPLETE][299] ([Intel XE#1195]) -> [DMESG-WARN][300] ([Intel XE#1214])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@xe_vm@large-split-binds-16777216.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_vm@large-split-binds-16777216.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-FAIL][301] ([Intel XE#1760]) -> [DMESG-WARN][302] ([Intel XE#1214] / [Intel XE#1760])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-adlp:         [DMESG-WARN][303] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][304] ([Intel XE#1214] / [Intel XE#1760])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1588
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
  [Intel XE#2022]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2022
  [Intel XE#2024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
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
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037 -> xe-pw-134654v1

  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037
  xe-pw-134654v1: 134654v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/index.html

--===============1349969370854248914==
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
<tr><td><b>Series:</b></td><td>Few GuC PC improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134654/">https://patchwork.freedesktop.org/series/134654/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037_full -&gt; xe-pw-134654v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134654v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134654v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134654v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-4/igt@kms_psr.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-b-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-2/igt@kms_sequence@queue-busy@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-3/igt@kms_sequence@queue-busy@pipe-b-edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-5/igt@xe_exec_threads@threads-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-6/igt@xe_exec_threads@threads-fd-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037_full and xe-pw-134654v1_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>Statuses : 1 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134654v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975">Intel XE#1975</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-128x42.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-lnl-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-lnl-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034">Intel XE#2034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034">Intel XE#2034</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-6/igt@xe_pm@s3-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-2/igt@xe_pm@s3-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s3-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-436/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-16777216:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-433/igt@xe_vm@large-split-binds-16777216.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-463/igt@xe_vm@large-split-binds-16777216.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134654v1/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037 -&gt; xe-pw-134654v1</li>
</ul>
<p>IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037<br />
  xe-pw-134654v1: 134654v1</p>

</body>
</html>

--===============1349969370854248914==--
