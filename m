Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264E6C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 08:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD23910F4D2;
	Wed, 17 Apr 2024 08:37:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2240F10F4D7;
 Wed, 17 Apr 2024 08:37:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2210784512515102973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_TTM_shrinker_helpers_and_xe_buf?=
 =?utf-8?q?fer_object_shrinker_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 08:37:40 -0000
Message-ID: <171334306011.1464373.2656874708860063502@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

--===============2210784512515102973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev2)
URL   : https://patchwork.freedesktop.org/series/131815/
State : failure

== Summary ==

CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -> xe-pw-131815v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131815v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131815v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131815v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_setmaster@master-drop-set-root.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@core_setmaster@master-drop-set-root.html

  * {igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit} (NEW):
    - {shard-lnl}:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_vm@large-split-binds-2097152:
    - shard-adlp:         [PASS][4] -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_vm@large-split-binds-2097152.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - {shard-lnl}:        [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@flip-vs-rmfb@a-edp2:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_flip@flip-vs-rmfb@a-edp2.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - {shard-lnl}:        [PASS][9] -> [DMESG-FAIL][10] +2 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - {shard-lnl}:        [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][13] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][14] +2 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - {shard-lnl}:        [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s4-multiple-execs:
    - {shard-lnl}:        [FAIL][17] ([Intel XE#1043]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  
New tests
---------

  New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full and xe-pw-131815v2_full:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 1 fail(s)
    - Exec time: [16.09] s

  

Known issues
------------

  Here are the changes found in xe-pw-131815v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1125] / [Intel XE#1201])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][20] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][21] ([Intel XE#1033] / [Intel XE#1214]) +3 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#801]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#650]) +8 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1177] / [Intel XE#1201])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#316]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1231]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#619])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +15 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201]) +34 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#787]) +57 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +37 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#787]) +68 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373]) +16 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_color@ctm-signed:
    - shard-adlp:         [PASS][43] -> [SKIP][44] ([Intel XE#1177] / [Intel XE#1201]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_color@ctm-signed.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#307])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][48] ([Intel XE#1195] / [Intel XE#927]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][49] ([Intel XE#1195])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][50] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][51] ([Intel XE#1214]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][56] ([Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#701])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1137] / [Intel XE#1201])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#310]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][60] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1226])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][64] ([Intel XE#324]) +3 other tests dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#656]) +56 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#1341])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#616])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [i915#2575])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][74] ([Intel XE#1331]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-adlp:         [PASS][75] -> [INCOMPLETE][76] ([Intel XE#1150] / [Intel XE#1195])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][77] ([Intel XE#324])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][78] ([Intel XE#616]) +9 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#361]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1129] / [Intel XE#1201])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         NOTRUN -> [FAIL][85] ([Intel XE#1203])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         [PASS][86] -> [SKIP][87] ([Intel XE#1201] / [Intel XE#1211])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_pm_rpm@modeset-lpsp.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1211]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#929]) +17 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1149] / [Intel XE#1201])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][94] ([Intel XE#294]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#294])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][96] ([Intel XE#1214] / [Intel XE#324])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#327])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][98] ([Intel XE#1174])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@query-forked-busy:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1201] / [i915#2575]) +16 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_vblank@query-forked-busy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_vblank@query-forked-busy.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][101] ([Intel XE#1214] / [Intel XE#1608])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#455]) +34 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#756])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#756])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#1050])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][107] -> [TIMEOUT][108] ([Intel XE#1473] / [Intel XE#821])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][109] -> [TIMEOUT][110] ([Intel XE#1473] / [Intel XE#392])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#688])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@once-virtual-basic:
    - shard-adlp:         [PASS][116] -> [DMESG-WARN][117] ([Intel XE#1214]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_balancer@once-virtual-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#1392]) +11 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr:
    - shard-adlp:         [PASS][119] -> [SKIP][120] ([Intel XE#1201]) +24 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@once-userptr:
    - shard-adlp:         [PASS][121] -> [FAIL][122] ([Intel XE#1069])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#288]) +25 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         NOTRUN -> [FAIL][125] ([Intel XE#1068])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-fd-basic:
    - shard-dg2-set2:     [PASS][126] -> [INCOMPLETE][127] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_exec_threads@threads-fd-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_exec_threads@threads-fd-basic.html

  * igt@xe_exec_threads@threads-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][128] -> [TIMEOUT][129] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_exec_threads@threads-fd-userptr-rebind.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@xe_exec_threads@threads-fd-userptr-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][130] ([Intel XE#1191] / [Intel XE#1214])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][133] -> [DMESG-WARN][134] ([Intel XE#1214]) +9 other tests dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][135] -> [ABORT][136] ([Intel XE#1205] / [Intel XE#1216])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_module_load@unload.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_module_load@unload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#379])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_noexec_ping_pong.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1061] / [Intel XE#1201])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][139] ([Intel XE#1221])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [PASS][140] -> [FAIL][141] ([Intel XE#355])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#366])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [PASS][143] -> [DMESG-WARN][144] ([Intel XE#1191] / [Intel XE#1214])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s3-exec-after.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [FAIL][145] ([Intel XE#1043] / [Intel XE#845])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#1201]) +42 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [DMESG-FAIL][149] ([Intel XE#1602]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][151] ([Intel XE#1231]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - {shard-lnl}:        [DMESG-FAIL][153] ([Intel XE#1602] / [Intel XE#1619]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][155] ([Intel XE#1204]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - {shard-lnl}:        [FAIL][157] ([Intel XE#581]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][159] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][162] +6 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@basic-plain-flip:
    - {shard-lnl}:        [DMESG-WARN][163] ([Intel XE#1330] / [Intel XE#1537]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip@basic-plain-flip.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-8/igt@kms_flip@basic-plain-flip.html
    - shard-adlp:         [INCOMPLETE][165] ([Intel XE#1150] / [Intel XE#1195] / [Intel XE#1330]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - {shard-lnl}:        [FAIL][167] ([Intel XE#480]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [SKIP][169] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][170] +8 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - {shard-lnl}:        [FAIL][171] ([Intel XE#886]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][173] ([Intel XE#1214]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][175] ([Intel XE#1201]) -> [PASS][176] +69 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [INCOMPLETE][177] ([Intel XE#1195]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - {shard-lnl}:        [INCOMPLETE][179] ([Intel XE#1602]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1214]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:
    - {shard-lnl}:        [DMESG-WARN][183] ([Intel XE#1330]) -> [PASS][184] +9 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - {shard-lnl}:        [SKIP][185] ([Intel XE#1646]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc5-psr:
    - {shard-lnl}:        [FAIL][187] ([Intel XE#718]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][189] ([Intel XE#1204]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - {shard-lnl}:        [FAIL][191] ([Intel XE#1605]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - {shard-lnl}:        [FAIL][193] ([Intel XE#899]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@wait-forked:
    - {shard-lnl}:        [DMESG-WARN][195] ([Intel XE#1602]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_vblank@wait-forked.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - {shard-lnl}:        [INCOMPLETE][197] ([Intel XE#1617]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
    - shard-adlp:         [INCOMPLETE][199] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - {shard-lnl}:        [DMESG-FAIL][201] ([Intel XE#1537]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_queue_property@invalid-property:
    - {shard-lnl}:        [DMESG-WARN][203] ([Intel XE#1537]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][205] ([Intel XE#1329]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-bal-userptr-rebind:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#1088] / [Intel XE#1330]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_threads@threads-bal-userptr-rebind.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_exec_threads@threads-bal-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     [TIMEOUT][209] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-basic:
    - {shard-lnl}:        [FAIL][211] ([Intel XE#1256]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_exec_threads@threads-hang-basic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-dg2-set2:     [FAIL][213] ([Intel XE#1256]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][215] ([Intel XE#1081]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [FAIL][217] -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-FAIL][219] ([Intel XE#1554]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@many-reload.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [FAIL][221] -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [INCOMPLETE][223] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s3-basic.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [FAIL][227] ([Intel XE#1081]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - {shard-lnl}:        [DMESG-FAIL][229] ([Intel XE#1619]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@xe_vm@large-userptr-binds-16777216.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - {shard-lnl}:        [FAIL][231] ([Intel XE#1440]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][233] ([Intel XE#1214]) -> [ABORT][234] ([Intel XE#1538])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [INCOMPLETE][235] ([Intel XE#1195] / [Intel XE#1538]) -> [ABORT][236] ([Intel XE#1538])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][237] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][238] ([Intel XE#1177] / [Intel XE#1201])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][239] ([Intel XE#1201]) -> [SKIP][240] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][242] ([Intel XE#1201])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][243] ([Intel XE#1177] / [Intel XE#1201]) -> [FAIL][244] ([Intel XE#1204])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][245] ([Intel XE#1619]) -> [DMESG-FAIL][246] ([Intel XE#324])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][247] ([Intel XE#1231]) -> [SKIP][248] ([Intel XE#1177] / [Intel XE#1201])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][249] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][250] ([Intel XE#1201])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][252] ([Intel XE#1201]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][253] ([Intel XE#1619]) -> [FAIL][254] ([Intel XE#616])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][255] ([Intel XE#1201]) -> [FAIL][256] ([Intel XE#616]) +1 other test fail
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][257] ([Intel XE#1231]) -> [DMESG-FAIL][258] ([Intel XE#1088] / [Intel XE#1330])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         [SKIP][259] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][260] ([Intel XE#1177] / [Intel XE#1201])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][261] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][262] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][264] ([Intel XE#1201] / [i915#2575])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         [SKIP][265] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][266] ([Intel XE#1201]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][267] ([Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][270] ([Intel XE#1201]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][271] ([Intel XE#1201]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#1252])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         [SKIP][273] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][274] ([Intel XE#1201]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][276] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_chamelium_frames@dp-frame-dump.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#1226])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-adlp:         [SKIP][279] ([Intel XE#1201]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#1178]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#455])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_content_protection@atomic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][284] ([Intel XE#1201] / [i915#2575])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][286] ([Intel XE#1201] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-adlp:         [SKIP][287] ([Intel XE#1201]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#308])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-adlp:         [SKIP][289] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][290] ([Intel XE#1201])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-dg2-set2:     [DMESG-WARN][291] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][292] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [FAIL][293] ([Intel XE#581]) -> [DMESG-WARN][294] ([Intel XE#1214] / [Intel XE#282])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         [SKIP][295] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][296] ([Intel XE#1201]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][297] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#1226])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         [SKIP][299] ([Intel XE#1201]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][301] ([Intel XE#1195]) -> [INCOMPLETE][302] ([Intel XE#1195] / [Intel XE#927])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [SKIP][303] ([Intel XE#1201]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [SKIP][305] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][306] ([Intel XE#1201])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][307] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][308] ([Intel XE#1195] / [Intel XE#927])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [DMESG-WARN][309] ([Intel XE#1162] / [Intel XE#1214]) -> [SKIP][310] ([Intel XE#1201] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][311] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][312] ([Intel XE#1195])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         [SKIP][313] ([Intel XE#1201]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-adlp:         [SKIP][315] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][316] ([Intel XE#1177] / [Intel XE#1201])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][317] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][318] ([Intel XE#1201] / [Intel XE#651])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [SKIP][319] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][320] ([Intel XE#1201]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][322] ([Intel XE#1201]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][323] ([Intel XE#1201]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#656]) +16 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][325] ([Intel XE#616]) -> [SKIP][326] ([Intel XE#1177] / [Intel XE#1201])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][327] ([Intel XE#1201]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#651])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-adlp:         [SKIP][331] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][332] ([Intel XE#1201]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#1226])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][335] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][336] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         [SKIP][337] ([Intel XE#1201]) -> [SKIP][338] ([Intel XE#1151] / [Intel XE#1201])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][339] ([Intel XE#1201]) -> [SKIP][340] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][342] ([Intel XE#1201]) +7 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][343] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][344] ([Intel XE#1201]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][345] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][346] ([Intel XE#1177] / [Intel XE#1201]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [SKIP][347] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][348] ([Intel XE#1201] / [Intel XE#417])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [SKIP][349] ([Intel XE#1201]) -> [INCOMPLETE][350] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][351] ([Intel XE#616]) -> [DMESG-FAIL][352] ([Intel XE#1162]) +1 other test dmesg-fail
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][353] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][354] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][355] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][356] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][357] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][358] ([Intel XE#1122] / [Intel XE#1201])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][360] ([Intel XE#1201])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][361] ([Intel XE#1148] / [Intel XE#1204]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#734])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [SKIP][363] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][364] ([Intel XE#1201])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][365] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][366] ([Intel XE#1201])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][368] ([Intel XE#1201]) +4 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][369] ([Intel XE#1201]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         [SKIP][371] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][372] ([Intel XE#1201])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         [SKIP][373] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][374] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][376] ([Intel XE#1201] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][378] ([Intel XE#1201] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         [SKIP][379] ([Intel XE#1201]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#330])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][381] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][382] ([Intel XE#1191] / [Intel XE#1214])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][383] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][384] ([Intel XE#1191] / [Intel XE#1214])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [INCOMPLETE][385] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][386] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][387] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][388] ([Intel XE#1191] / [Intel XE#1214])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][390] ([Intel XE#1201] / [i915#2575])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_writeback@writeback-check-output.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-adlp:         [SKIP][391] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][392] ([Intel XE#1201])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-adlp:         [SKIP][393] ([Intel XE#1201]) -> [SKIP][394] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][395] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][396] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         [SKIP][397] ([Intel XE#1201]) -> [SKIP][398] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-adlp:         [SKIP][399] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][400] ([Intel XE#1201])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-adlp:         [SKIP][401] ([Intel XE#1201]) -> [SKIP][402] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [SKIP][403] ([Intel XE#1201]) -> [FAIL][404] ([Intel XE#1396])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][406] ([Intel XE#1201]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         [SKIP][407] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][408] ([Intel XE#1201]) +3 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         [SKIP][409] ([Intel XE#1201]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         [SKIP][411] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][412] ([Intel XE#1201])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3cold-basic-exec.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][413] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][414] ([Intel XE#1214] / [Intel XE#1608])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [SKIP][415] ([Intel XE#1201]) -> [DMESG-WARN][416] ([Intel XE#1214] / [Intel XE#1608])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [FAIL][417] ([Intel XE#1043] / [Intel XE#845]) -> [SKIP][418] ([Intel XE#1201])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         [SKIP][419] ([Intel XE#1201]) -> [SKIP][420] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][422] ([Intel XE#1201])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - shard-adlp:         [DMESG-FAIL][423] ([Intel XE#1619]) -> [SKIP][424] ([Intel XE#1201])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_vm@large-userptr-binds-16777216.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_vm@large-userptr-binds-16777216.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1495]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1554]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1647]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1647
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
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
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575


Build changes
-------------

  * IGT: IGT_7806 -> IGT_7807
  * Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -> xe-pw-131815v2

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb
  xe-pw-131815v2: 131815v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html

--===============2210784512515102973==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -&gt; xe-pw-131815v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131815v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131815v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131815v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2097152:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_vm@large-split-binds-2097152.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-edp2:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_flip@flip-vs-rmfb@a-edp2.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-slowdraw.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_live_ktest@xe_bo.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full and xe-pw-131815v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [16.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131815v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_vblank@query-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_vblank@query-forked-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_balancer@once-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_exec_threads@threads-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_exec_threads@threads-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_exec_threads@threads-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@xe_exec_threads@threads-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-466/igt@xe_module_load@unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@xe_pm@d3hot-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +42 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-top-bottom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-8/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> +69 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646">Intel XE#1646</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605">Intel XE#1605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@kms_vblank@wait-forked.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617">Intel XE#1617</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-3/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_threads@threads-bal-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_exec_threads@threads-bal-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_exec_threads@threads-hang-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@many-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554">Intel XE#1554</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-4/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-lnl-5/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148">Intel XE#1148</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-1/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v2/shard-adlp-6/igt@xe_vm@large-userptr-binds-16777216.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGT_7807</li>
<li>Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -&gt; xe-pw-131815v2</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb<br />
  xe-pw-131815v2: 131815v2</p>

</body>
</html>

--===============2210784512515102973==--
