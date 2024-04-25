Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8F6C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 06:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2E11A1B9;
	Thu, 25 Apr 2024 06:31:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84511A1B9;
 Thu, 25 Apr 2024 06:31:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6662396605376098970=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5BCI=2C1/?=
 =?utf-8?q?3=5D_drm/xe=3A_Store_xe=5Fhw=5Fengine_in_xe=5Fhw=5Fengine=5Fsnaps?=
 =?utf-8?q?hot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 06:31:50 -0000
Message-ID: <171402671037.1649891.10210024533554309355@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424140319.61651-1-jose.souza@intel.com>
In-Reply-To: <20240424140319.61651-1-jose.souza@intel.com>
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

--===============6662396605376098970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot
URL   : https://patchwork.freedesktop.org/series/132848/
State : failure

== Summary ==

CI Bug Log - changes from xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_full -> xe-pw-132848v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132848v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132848v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132848v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-adlp:         [SKIP][2] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_crc@cursor-random-512x512:
    - {shard-lnl}:        NOTRUN -> [FAIL][4] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - {shard-lnl}:        [SKIP][5] ([Intel XE#1424]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_edge_walk@64x64-right-edge:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][7] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-right-edge.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - {shard-lnl}:        [PASS][8] -> [FAIL][9] +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - {shard-lnl}:        [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  
New tests
---------

  New tests have been introduced between xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_full and xe-pw-132848v1_full:

### New IGT tests (18) ###

  * igt@core_hotunplug:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@dpms-vs-vblank-race@a-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [56.70] s

  * igt@kms_flip@dpms-vs-vblank-race@b-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [57.17] s

  * igt@kms_flip@dpms-vs-vblank-race@c-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [49.75] s

  * igt@kms_vrr@max-min@pipe-a-edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [72.57] s

  * igt@xe_exec_fault_mode@many-basic-imm:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@many-rebind-imm:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-basic-imm:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@once-userptr-imm:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in xe-pw-132848v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-adlp:         [PASS][12] -> [SKIP][13] ([Intel XE#1201]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-128.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][14] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][15] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][16] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#316])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#616])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][21] -> [SKIP][22] ([Intel XE#1201] / [Intel XE#829])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1204])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#619])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@basic:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#346]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +35 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1252])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-7.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#829])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#314])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#307])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#323])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#1214]) +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1214])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][51] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][54] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#702])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1138] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1135] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#310]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@dpms-vs-vblank-race@c-edp2 (NEW):
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][59] ([Intel XE#1602]) +3 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@kms_flip@dpms-vs-vblank-race@c-edp2.html

  * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214]) +4 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][61] ([Intel XE#1195])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][62] ([Intel XE#324]) +1 other test dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#540])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#656]) +48 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][66] -> [FAIL][67] ([Intel XE#616]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#658])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1341])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201]) +23 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a:
    - shard-adlp:         NOTRUN -> [FAIL][74] ([Intel XE#1331]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#870])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1129] / [Intel XE#1201])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#1211])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         [PASS][78] -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1211])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#1201] / [Intel XE#1211])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1122] / [Intel XE#1201])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1122] / [Intel XE#1201])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#929]) +16 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][88] ([Intel XE#1174])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#330])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         NOTRUN -> [FAIL][90] ([Intel XE#771] / [Intel XE#899])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][91] ([Intel XE#899])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@query-idle-hang:
    - shard-adlp:         [PASS][92] -> [INCOMPLETE][93] ([Intel XE#1195]) +1 other test incomplete
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@query-idle-hang.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_vblank@query-idle-hang.html

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][94] ([Intel XE#1195]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#455]) +30 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#756])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1091] / [Intel XE#1201])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1447])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1123] / [Intel XE#1201])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][101] -> [TIMEOUT][102] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][103] -> [TIMEOUT][104] ([Intel XE#1473] / [Intel XE#821])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#261]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][106] -> [DMESG-FAIL][107] ([Intel XE#821])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][108] -> [TIMEOUT][109] ([Intel XE#1473])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][111] -> [TIMEOUT][112] ([Intel XE#1473] / [Intel XE#392])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#688])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         [PASS][114] -> [DMESG-FAIL][115] ([Intel XE#1619])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#1392]) +13 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#288]) +49 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm (NEW):
    - {shard-lnl}:        NOTRUN -> [FAIL][118] ([Intel XE#1069])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#288]) +37 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][121] ([Intel XE#1068])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [PASS][122] -> [DMESG-FAIL][123] ([Intel XE#1069] / [Intel XE#1619])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - shard-adlp:         [PASS][124] -> [INCOMPLETE][125] ([Intel XE#1169] / [Intel XE#1195])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-adlp:         [PASS][126] -> [DMESG-FAIL][127] ([Intel XE#1088] / [Intel XE#1330] / [Intel XE#1619])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#1192] / [Intel XE#1201])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][132] -> [ABORT][133] ([Intel XE#1205] / [Intel XE#1216])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#977])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#977])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#366])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][138] ([Intel XE#1214] / [Intel XE#1608])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][139] -> [INCOMPLETE][140] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html
    - shard-dg2-set2:     [PASS][141] -> [DMESG-WARN][142] ([Intel XE#1162] / [Intel XE#1214])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [FAIL][143] ([Intel XE#1043] / [Intel XE#845]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#944]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@large-binds-1073741824:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][145] ([Intel XE#1619]) +1 other test dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_vm@large-binds-1073741824.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][146] ([Intel XE#1214]) -> [PASS][147] +7 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [i915#6077]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_addfb_basic@unused-modifier.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][151] +2 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-lnl}:        [DMESG-FAIL][152] ([Intel XE#1537] / [Intel XE#1602] / [Intel XE#1619]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][154] ([Intel XE#1231]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][158] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#1195]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-adlp:         [INCOMPLETE][162] ([Intel XE#1195]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_flip@plain-flip-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - {shard-lnl}:        [FAIL][164] ([Intel XE#480]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
    - {shard-lnl}:        [FAIL][166] ([Intel XE#886]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-adlp:         [DMESG-WARN][168] ([Intel XE#1214]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][170] ([Intel XE#324]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][172] ([Intel XE#616]) -> [PASS][173] +10 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201]) -> [PASS][175] +6 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - {shard-lnl}:        [INCOMPLETE][176] ([Intel XE#1602]) -> [PASS][177] +2 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@pixel-format-source-clamping:
    - {shard-lnl}:        [INCOMPLETE][178] ([Intel XE#1595] / [Intel XE#1602]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr@psr2-cursor-blt:
    - {shard-lnl}:        [DMESG-WARN][184] ([Intel XE#1537] / [Intel XE#1602]) -> [PASS][185] +5 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_psr@psr2-cursor-blt.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-6/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][186] ([Intel XE#1201]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:
    - shard-adlp:         [SKIP][188] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][192] ([Intel XE#821]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][194] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [DMESG-FAIL][196] ([Intel XE#482]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][198] -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [ABORT][200] ([Intel XE#1249] / [Intel XE#1304] / [Intel XE#1364]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - {shard-lnl}:        [INCOMPLETE][202] -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - {shard-lnl}:        [FAIL][204] ([Intel XE#1256]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-basic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][206] ([Intel XE#1081]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [FAIL][208] -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-adlp:         [FAIL][210] ([Intel XE#1081]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][212] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [INCOMPLETE][214] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - {shard-lnl}:        [DMESG-WARN][216] ([Intel XE#1602]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_prime_self_import@export-vs-gem_close-race.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_prime_self_import@export-vs-gem_close-race.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         [FAIL][218] ([Intel XE#1559]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html
    - shard-dg2-set2:     [FAIL][220] ([Intel XE#1559]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@xe_vm@bind-flag-invalid.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_vm@bind-flag-invalid.html
    - {shard-lnl}:        [FAIL][222] ([Intel XE#1559]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_vm@bind-flag-invalid.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_vm@bind-flag-invalid.html

  * igt@xe_vm@bind-once:
    - {shard-lnl}:        [DMESG-FAIL][224] ([Intel XE#1330] / [Intel XE#1537] / [Intel XE#1602] / [Intel XE#1619]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_vm@bind-once.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-7/igt@xe_vm@bind-once.html
    - shard-adlp:         [DMESG-FAIL][226] ([Intel XE#1088] / [Intel XE#1330]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_vm@bind-once.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][228] ([Intel XE#1538] / [Intel XE#1689]) -> [INCOMPLETE][229] ([Intel XE#1195])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][230] ([Intel XE#324]) -> [FAIL][231] ([Intel XE#1231])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [FAIL][232] ([Intel XE#616]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#829])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         [FAIL][234] ([Intel XE#616]) -> [DMESG-FAIL][235] ([Intel XE#1619])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#610])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][240] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#306])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         [SKIP][244] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][245] ([Intel XE#1201]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][249] ([Intel XE#1178])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][250] ([Intel XE#1188]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#455])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_content_protection@uevent.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][252] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][253] ([Intel XE#1195]) +1 other test incomplete
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][254] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][255] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#323])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         [SKIP][258] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][259] ([Intel XE#1201])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][260] ([Intel XE#1214] / [Intel XE#282]) -> [INCOMPLETE][261] ([Intel XE#1195])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][264] ([Intel XE#1214]) -> [INCOMPLETE][265] ([Intel XE#1195])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
    - shard-adlp:         [DMESG-WARN][266] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][267] ([Intel XE#1195] / [Intel XE#927]) +1 other test incomplete
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][268] ([Intel XE#324] / [Intel XE#358]) -> [FAIL][269] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#658])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][276] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][277] ([Intel XE#1201]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-adlp:         [SKIP][278] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][279] ([Intel XE#1201])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#687]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#605])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [INCOMPLETE][282] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][283] ([Intel XE#1191] / [Intel XE#1214])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][284] ([Intel XE#1195]) -> [DMESG-WARN][285] ([Intel XE#1191] / [Intel XE#1214])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][286] ([Intel XE#1162]) -> [FAIL][287] ([Intel XE#616]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         [SKIP][288] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#829])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][290] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][291] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][292] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][293] ([Intel XE#904] / [Intel XE#909])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][294] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][295] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][296] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][297] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][298] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][299] ([Intel XE#1201])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][300] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#836])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][302] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][303] ([Intel XE#1201] / [Intel XE#1211])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-adlp:         [SKIP][306] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][307] ([Intel XE#1201])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         [SKIP][308] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][309] ([Intel XE#1201] / [Intel XE#829])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         [SKIP][310] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][311] ([Intel XE#1201])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [INCOMPLETE][312] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][313] ([Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][314] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][315] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358] / [Intel XE#569])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [DMESG-WARN][316] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][317] ([Intel XE#1195] / [Intel XE#1358])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_pm@s3-exec-after.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_pm@s3-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1053]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1053
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1249
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7820 -> IGT_7821
  * Linux: xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00 -> xe-pw-132848v1

  IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7821: fffcce4ac88b1c4e68825d564515470e72d2c40f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00: d28c0a7e868367b2d1d9ab3f80dcd0380de92a00
  xe-pw-132848v1: 132848v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html

--===============6662396605376098970==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132848/">https://patchwork.freedesktop.org/series/132848/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_full -&gt; xe-pw-132848v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132848v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132848v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132848v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-random-512x512:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-rapid-movement-max-size:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x512.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-right-edge.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_full and xe-pw-132848v1_full:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@core_hotunplug:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [56.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [57.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [49.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [72.57] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-imm:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132848v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-edp2 (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@kms_flip@dpms-vs-vblank-race@c-edp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_vblank@query-idle-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_exec_threads@threads-hang-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-1073741824:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_vm@large-binds-1073741824.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_addfb_basic@unused-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_addfb_basic@unused-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_flip@plain-flip-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@plain-flip-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@kms_psr@psr2-cursor-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-6/igt@kms_psr@psr2-cursor-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-5/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1249">Intel XE#1249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364">Intel XE#1364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_prime_self_import@export-vs-gem_close-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_prime_self_import@export-vs-gem_close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559">Intel XE#1559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@xe_vm@bind-flag-invalid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559">Intel XE#1559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_vm@bind-flag-invalid.html">PASS</a></li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_vm@bind-flag-invalid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559">Intel XE#1559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-1/igt@xe_vm@bind-flag-invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-lnl-3/igt@xe_vm@bind-once.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-lnl-7/igt@xe_vm@bind-once.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_vm@bind-once.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_vm@bind-once.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-4/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00/shard-adlp-8/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/shard-adlp-9/igt@xe_pm@s3-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7820 -&gt; IGT_7821</li>
<li>Linux: xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00 -&gt; xe-pw-132848v1</li>
</ul>
<p>IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7821: fffcce4ac88b1c4e68825d564515470e72d2c40f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00: d28c0a7e868367b2d1d9ab3f80dcd0380de92a00<br />
  xe-pw-132848v1: 132848v1</p>

</body>
</html>

--===============6662396605376098970==--
