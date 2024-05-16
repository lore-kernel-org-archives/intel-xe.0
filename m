Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7689C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 00:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7389010E326;
	Thu, 16 May 2024 00:05:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6E810E326;
 Thu, 16 May 2024 00:05:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2700526878836313353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Per_client_usage_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 00:05:37 -0000
Message-ID: <171581793719.2118035.5840889810539591485@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

--===============2700526878836313353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Per client usage (rev4)
URL   : https://patchwork.freedesktop.org/series/132477/
State : failure

== Summary ==

CI Bug Log - changes from xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7_full -> xe-pw-132477v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132477v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132477v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132477v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +8 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_plane@plane-position-hole-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1201] / [Intel XE#929]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - {shard-lnl}:        [SKIP][11] ([Intel XE#373]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - {shard-lnl}:        NOTRUN -> [ABORT][13] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@xe_exec_basic@many-null-rebind:
    - {shard-lnl}:        [PASS][14] -> [ABORT][15] +3 other tests abort
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-4/igt@xe_exec_basic@many-null-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@xe_exec_basic@many-null-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-132477v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][17] ([Intel XE#324])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_color@degamma@pipe-b:
    - shard-adlp:         [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1195]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-9/igt@kms_color@degamma@pipe-b.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_color@degamma@pipe-b.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#309])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#877])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#776])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@pixel-format@pipe-a:
    - shard-dg2-set2:     [PASS][37] -> [ABORT][38] ([Intel XE#1035]) +1 other test abort
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_plane@pixel-format@pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@kms_plane@pixel-format@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#870])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#1211])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#327])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#771] / [Intel XE#899])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#771] / [Intel XE#899])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#899])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#899])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#756])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331:
    - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1195]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1062] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][59] -> [TIMEOUT][60] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#261])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - shard-dg2-set2:     [PASS][64] -> [DMESG-WARN][65] ([Intel XE#1214])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#1638])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#1337])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#979])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][72] ([Intel XE#1214])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1214])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#944])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#1760])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][78] +8 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@kms_cursor_crc@cursor-size-change.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-464/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - {shard-lnl}:        [DMESG-WARN][79] ([Intel XE#1830]) -> [PASS][80] +2 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - {shard-lnl}:        [SKIP][83] ([Intel XE#1211]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][85] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][87] ([Intel XE#1600]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [FAIL][89] ([Intel XE#1256]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_pm@s2idle-basic:
    - {shard-lnl}:        [DMESG-WARN][91] ([Intel XE#1595]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-6/igt@xe_pm@s2idle-basic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#1214]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451]) -> [ABORT][96] ([Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#316]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][100] ([Intel XE#316]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1124]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][104] ([Intel XE#619])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][106] ([Intel XE#610])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1124]) -> [SKIP][108] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#346]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#346])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_joiner@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][112] ([Intel XE#367]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#367]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][118] ([Intel XE#787]) +55 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][122] ([Intel XE#1252])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][124] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][126] ([Intel XE#306])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#306]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][130] ([Intel XE#373]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#373]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][134] ([Intel XE#308])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#308]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#308])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][138] ([Intel XE#455]) +15 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][140] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#323]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [DMESG-WARN][143] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][144] ([Intel XE#282]) +4 other tests dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][145] ([Intel XE#282]) -> [DMESG-WARN][146] ([Intel XE#1214] / [Intel XE#282]) +8 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][148] ([Intel XE#323])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][150] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@single-move.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@single-move.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][152] ([Intel XE#776])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][154] ([Intel XE#703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][156] ([Intel XE#1191] / [Intel XE#1214])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][157] ([Intel XE#1162]) -> [DMESG-WARN][158] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [i915#5274]) -> [SKIP][160] ([i915#5274])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#658]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#658])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#651]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][166] ([Intel XE#651]) +21 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#653]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][170] ([Intel XE#658])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][172] ([Intel XE#653]) +20 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#605]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#605])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#417]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#417])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#356]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#356])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][180] ([Intel XE#1035] / [Intel XE#1195])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][182] ([Intel XE#1195])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][186] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][188] ([Intel XE#498]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#305]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#870]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][196] ([Intel XE#870])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][198] ([Intel XE#929]) +13 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#929]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1149]) -> [SKIP][202] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#327]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#327])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][206] ([Intel XE#327]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][208] ([Intel XE#756])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#756]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#756])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1123])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1123]) -> [SKIP][214] ([Intel XE#1123] / [Intel XE#1201])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1126]) -> [SKIP][216] ([Intel XE#1126] / [Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][218] ([Intel XE#1130]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][219] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][220] ([Intel XE#1473] / [Intel XE#392])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#288]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][224] ([Intel XE#288]) +17 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1192]) -> [SKIP][226] ([Intel XE#1192] / [Intel XE#1201])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][228] ([Intel XE#1337])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][230] ([Intel XE#979])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][231] ([Intel XE#1191] / [Intel XE#1214]) -> [ABORT][232] ([Intel XE#1191] / [Intel XE#1358])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@xe_pm@s2idle-basic.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-6/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][233] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][234] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][236] ([Intel XE#366])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [INCOMPLETE][237] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [INCOMPLETE][238] ([Intel XE#1195] / [Intel XE#1358])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [INCOMPLETE][239] ([Intel XE#1195] / [Intel XE#1694]) -> [DMESG-WARN][240] ([Intel XE#1214] / [Intel XE#1608])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [INCOMPLETE][241] ([Intel XE#1195]) -> [DMESG-WARN][242] ([Intel XE#1214] / [Intel XE#1608])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][244] ([Intel XE#944]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7 -> xe-pw-132477v4

  IGT_7856: 280f66b4d83048ea76bea6fd31af648c51996486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7: be81838bd7d4faec2955962ed6a74e3f4cc6daf7
  xe-pw-132477v4: 132477v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html

--===============2700526878836313353==
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
<tr><td><b>Series:</b></td><td>drm/xe: Per client usage (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132477/">https://patchwork.freedesktop.org/series/132477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7_full -&gt; xe-pw-132477v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132477v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132477v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132477v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_plane@plane-position-hole-dpms.html">ABORT</a> +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-4/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@xe_exec_basic@many-null-rebind.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132477v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-9/igt@kms_color@degamma@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_color@degamma@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_plane@pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@kms_plane@pixel-format@pipe-a.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile64-uncompressed-compfmt0-vram01-vram01-331x331.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@kms_cursor_crc@cursor-size-change.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-464/igt@kms_cursor_crc@cursor-size-change.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-lnl-6/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-lnl-7/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-463/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-6/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v4/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7 -&gt; xe-pw-132477v4</li>
</ul>
<p>IGT_7856: 280f66b4d83048ea76bea6fd31af648c51996486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1294-be81838bd7d4faec2955962ed6a74e3f4cc6daf7: be81838bd7d4faec2955962ed6a74e3f4cc6daf7<br />
  xe-pw-132477v4: 132477v4</p>

</body>
</html>

--===============2700526878836313353==--
