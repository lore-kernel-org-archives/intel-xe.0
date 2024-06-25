Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4D4C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C386810E254;
	Tue, 25 Jun 2024 21:06:29 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10B810E254;
 Tue, 25 Jun 2024 21:06:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1120397329185319727=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Capture_per_client_stats_when_d?=
 =?utf-8?q?estroying_an_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 21:06:27 -0000
Message-ID: <171934958764.158784.13615376841364653838@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
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

--===============1120397329185319727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Capture per client stats when destroying an exec queue
URL   : https://patchwork.freedesktop.org/series/135372/
State : failure

== Summary ==

CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_full -> xe-pw-135372v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135372v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135372v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135372v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_plane@pixel-format-source-clamping.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@testdisplay.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@testdisplay.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-dg2-set2:     [PASS][9] -> [TIMEOUT][10] +18 other tests timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_exec_compute_mode@many-execqueues-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [PASS][11] -> [TIMEOUT][12] +12 other tests timeout
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][13] ([Intel XE#1551]) -> [DMESG-FAIL][14] +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][15] ([Intel XE#1874]) -> [DMESG-FAIL][16] +5 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][17] ([Intel XE#1035] / [Intel XE#1195]) -> [DMESG-FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - {shard-lnl}:        [SKIP][19] ([Intel XE#651]) -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * {igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0}:
    - shard-adlp:         [WARN][21] ([Intel XE#2078]) -> [DMESG-FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * {igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5}:
    - shard-adlp:         [PASS][23] -> [WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html

  * {igt@kms_plane@pixel-format@pipe-a-plane-0}:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-FAIL][26] +3 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane@pixel-format@pipe-a-plane-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format@pipe-a-plane-0.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - {shard-lnl}:        [PASS][27] -> [INCOMPLETE][28] +5 other tests incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][29] +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - {shard-lnl}:        NOTRUN -> [TIMEOUT][30] +12 other tests timeout
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
    - {shard-lnl}:        [PASS][31] -> [TIMEOUT][32] +15 other tests timeout
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        [ABORT][33] ([Intel XE#2097]) -> [TIMEOUT][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-135372v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][35] -> [FAIL][36] ([Intel XE#1204])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][37] -> [DMESG-FAIL][38] ([Intel XE#324])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#1231]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio.html
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#373])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#306])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#306])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#307])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#307])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#308])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1214]) +65 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][59] ([Intel XE#1214]) +6 other tests dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214]) +4 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1214]) +38 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-adlp:         [PASS][65] -> [SKIP][66] ([Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#1874]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][73] ([Intel XE#1861])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][74] -> [FAIL][75] ([Intel XE#1861])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#658])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1158] / [Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#653])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][81] -> [DMESG-WARN][82] ([Intel XE#1162] / [Intel XE#1214])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@pixel-format:
    - shard-dg2-set2:     [PASS][83] -> [INCOMPLETE][84] ([Intel XE#1035] / [Intel XE#1195])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane@pixel-format.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#870])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#836])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1122] / [Intel XE#1201])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1122] / [Intel XE#1201])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#929])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#929])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1149] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#1214] / [Intel XE#2055]) +1 other test dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-180.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][95] ([Intel XE#1174])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#771] / [Intel XE#899])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][98] -> [FAIL][99] ([Intel XE#899])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flip-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#455])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_vrr@flip-dpms.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1123] / [Intel XE#1201])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1123] / [Intel XE#1201])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][104] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#688])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
    - shard-dg2-set2:     [PASS][106] -> [INCOMPLETE][107] ([Intel XE#1195]) +2 other tests incomplete
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][108] ([Intel XE#1195]) +1 other test incomplete
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html
    - shard-adlp:         [PASS][109] -> [INCOMPLETE][110] ([Intel XE#1195])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#1392])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - shard-adlp:         [PASS][114] -> [INCOMPLETE][115] ([Intel XE#1169] / [Intel XE#1195])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
    - shard-dg2-set2:     [PASS][116] -> [INCOMPLETE][117] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [PASS][118] -> [FAIL][119] ([Intel XE#1045] / [Intel XE#1204])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#1192] / [Intel XE#1201])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1008] / [Intel XE#1201])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][123] -> [DMESG-WARN][124] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][125] -> [DMESG-WARN][126] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#366])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][128] -> [ABORT][129] ([Intel XE#1358]) +1 other test abort
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#944])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [INCOMPLETE][132] ([Intel XE#1195] / [Intel XE#1451]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][134] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][136] ([Intel XE#1874]) -> [PASS][137] +8 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][138] ([Intel XE#1231]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][140] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][142] ([Intel XE#886]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#324]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][148] ([Intel XE#1861]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - {shard-lnl}:        [SKIP][150] ([Intel XE#1503]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@kms_hdr@bpc-switch.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-2/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#361]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [INCOMPLETE][156] ([Intel XE#1195]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][158] ([Intel XE#771] / [Intel XE#899]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][160] ([Intel XE#899]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - {shard-lnl}:        [SKIP][162] ([Intel XE#1899]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][164] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - {shard-lnl}:        [ABORT][166] -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [FAIL][168] ([Intel XE#1414]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html
    - shard-adlp:         [FAIL][170] ([Intel XE#1414]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][174] ([Intel XE#1214]) -> [PASS][175] +2 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][176] ([Intel XE#1794]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency:
    - shard-adlp:         [SKIP][180] ([Intel XE#1201]) -> [PASS][181] +6 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_pm_residency@idle-residency.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@xe_pm_residency@idle-residency.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][183] ([Intel XE#873])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         [SKIP][184] ([Intel XE#1201]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#316])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][187] ([Intel XE#316]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#316]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][190] ([Intel XE#324]) -> [FAIL][191] ([Intel XE#1231])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#619]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#619])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][195] ([Intel XE#1124]) +6 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][196] ([Intel XE#1231]) -> [FAIL][197] ([Intel XE#1242])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1124]) -> [SKIP][199] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][201] ([Intel XE#367])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#367]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#787]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#1252])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][211] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-adlp:         [SKIP][212] ([Intel XE#1201]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][215] ([Intel XE#787]) +27 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#306]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#306])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][219] ([Intel XE#306])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#373]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-multiple.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][223] ([Intel XE#373]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#1195] / [Intel XE#2075]) -> [FAIL][225] ([Intel XE#1178])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][226] -> [FAIL][227] ([Intel XE#1178])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][229] ([Intel XE#308])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-adlp:         [SKIP][230] ([Intel XE#1201]) -> [DMESG-WARN][231] ([Intel XE#1214])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#308]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#308])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#323]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#323])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][237] ([Intel XE#323])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][238] ([Intel XE#1201]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#455])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][241] ([Intel XE#307]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#776]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#776])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1138]) -> [SKIP][245] ([Intel XE#1138] / [Intel XE#1201])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1135]) -> [SKIP][247] ([Intel XE#1135] / [Intel XE#1201])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][249] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#455]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][253] ([Intel XE#651]) +17 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#658]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#658])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#651]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#653]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][260] ([Intel XE#1201]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][263] ([Intel XE#653]) +15 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#417]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#417])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][267] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][269] ([Intel XE#498]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#498]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#305]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#870]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#870])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#908]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#908])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1489]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][285] ([Intel XE#1489]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1122]) -> [SKIP][287] ([Intel XE#1122] / [Intel XE#1201])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][289] ([Intel XE#1122])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         [SKIP][290] ([Intel XE#1201]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#929])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_psr@fbc-pr-suspend.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#929]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][295] ([Intel XE#929]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][297] ([Intel XE#1127])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][299] ([Intel XE#455]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1500]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#1500])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][303] ([Intel XE#756])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1091]) -> [SKIP][305] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1123]) -> [SKIP][307] ([Intel XE#1123] / [Intel XE#1201])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         [SKIP][308] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][309] ([Intel XE#1126] / [Intel XE#1201])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#944]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#944])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][312] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][313] ([Intel XE#1473] / [Intel XE#392])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][315] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][316] ([Intel XE#1201]) -> [SKIP][317] ([Intel XE#1201] / [Intel XE#288])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][319] ([Intel XE#288]) +13 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#288]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#512]) -> [SKIP][323] ([Intel XE#1201] / [Intel XE#512])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_mmap@small-bar.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#1337]) -> [SKIP][325] ([Intel XE#1201] / [Intel XE#1337])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#366]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][329] ([Intel XE#366]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#579]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#579])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][333] ([Intel XE#944])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][334] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][335] ([Intel XE#1760])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2075
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7898 -> IGT_7900
  * Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -> xe-pw-135372v1

  IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3
  xe-pw-135372v1: 135372v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html

--===============1120397329185319727==
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
<tr><td><b>Series:</b></td><td>Capture per client stats when destroying an exec queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135372/">https://patchwork.freedesktop.org/series/135372/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_full -&gt; xe-pw-135372v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135372v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135372v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135372v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-6.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format-source-clamping.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@testdisplay.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_exec_compute_mode@many-execqueues-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html">TIMEOUT</a> +18 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">TIMEOUT</a> +12 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-5.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format@pipe-a-plane-0}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane@pixel-format@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format@pipe-a-plane-0.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-basic.html">TIMEOUT</a> +12 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html">TIMEOUT</a> +15 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097">Intel XE#2097</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135372v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +65 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-2/igt@kms_hdr@bpc-switch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899">Intel XE#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_pm_residency@idle-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@xe_pm_residency@idle-residency.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2075">Intel XE#2075</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-64x21.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-2/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-463/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135372v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7898 -&gt; IGT_7900</li>
<li>Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -&gt; xe-pw-135372v1</li>
</ul>
<p>IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3<br />
  xe-pw-135372v1: 135372v1</p>

</body>
</html>

--===============1120397329185319727==--
