Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2A6EE57CE
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 18:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8E10EA7E;
	Wed, 11 Sep 2024 18:54:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9E10EA7D;
 Wed, 11 Sep 2024 18:54:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2957474350865685723=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5Bv2=2C1/?=
 =?utf-8?q?4=5D_drm/xe/client=3A_fix_deadlock_in_show=5Fmeminfo=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 18:54:18 -0000
Message-ID: <172608085896.987697.2798399749819984971@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911155527.178910-5-matthew.auld@intel.com>
In-Reply-To: <20240911155527.178910-5-matthew.auld@intel.com>
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

--===============2957474350865685723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/4] drm/xe/client: fix deadlock in show_meminfo()
URL   : https://patchwork.freedesktop.org/series/138535/
State : failure

== Summary ==

CI Bug Log - changes from xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_full -> xe-pw-138535v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138535v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138535v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138535v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:
    - {shard-bmg}:        [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html

  
Known issues
------------

  Here are the changes found in xe-pw-138535v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#623])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1033])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#1426]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          NOTRUN -> [FAIL][11] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#619])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1467])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#619])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1512])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1399]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +29 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#1252])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1252])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#314])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#309]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#877]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-lnl:          [PASS][43] -> [SKIP][44] ([Intel XE#2351])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_draw_crc@draw-method-mmap-wc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1616])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#776])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#310])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1421]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1401]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][52] ([Intel XE#324]) +1 other test dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#1332])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#1861])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#651]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [CRASH][62] ([Intel XE#2749]) +4 other tests crash
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1503] / [Intel XE#599])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#356])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][66] ([Intel XE#1035] / [Intel XE#1195])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][67] ([Intel XE#2078]) +1 other test warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#324]) +1 other test dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-7/igt@kms_plane@plane-position-hole.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#599]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#361])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2318]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1439])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [FAIL][79] ([Intel XE#2749]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1128])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-lnl:          NOTRUN -> [CRASH][81] ([Intel XE#2748]) +1 other test crash
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [WARN][82] ([Intel XE#2748]) +1 other test warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1406])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1437])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#362])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][90] ([Intel XE#2443]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#688]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#688])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1392]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][102] ([Intel XE#1962])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_store@basic-all:
    - shard-lnl:          [PASS][103] -> [SKIP][104] ([Intel XE#1130]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_exec_store@basic-all.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_exec_store@basic-all.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][105] -> [DMESG-FAIL][106] ([Intel XE#1620] / [Intel XE#1760])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#512])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][109] ([Intel XE#2514])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#2541])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1061])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2284] / [Intel XE#366])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][113] -> [ABORT][114] ([Intel XE#1358] / [Intel XE#1607])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][115] -> [ABORT][116] ([Intel XE#1794])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][117] -> [FAIL][118] ([Intel XE#958])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#944])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#944])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][121] ([Intel XE#1033]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][123] ([Intel XE#1426]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
    - {shard-bmg}:        [FAIL][125] ([Intel XE#1426]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][127] ([Intel XE#1659]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][129] ([Intel XE#2436]) -> [PASS][130] +3 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1551]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][133] ([Intel XE#877]) -> [PASS][134] +14 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][135] -> [PASS][136] +3 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#877]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - {shard-bmg}:        [INCOMPLETE][141] ([Intel XE#2635]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-adlp:         [INCOMPLETE][143] ([Intel XE#1195]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-6/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-8/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][145] ([Intel XE#886]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][147] ([Intel XE#1874]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#361]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#771] / [Intel XE#899]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#899]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][155] ([Intel XE#899]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][157] ([Intel XE#1523]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_vblank@accuracy-idle.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][159] ([Intel XE#1473]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#1600]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#1000]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][165] ([Intel XE#2105]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - shard-lnl:          [ABORT][167] -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [INCOMPLETE][169] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@xe_pm@s2idle-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][171] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-basic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][173] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][175] ([Intel XE#1794]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][178] ([Intel XE#873])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#316]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#316])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][182] ([Intel XE#316])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][183] ([Intel XE#1124]) -> [SKIP][184] ([Intel XE#2351])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#324]) -> [FAIL][186] ([Intel XE#1231])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1124]) -> [SKIP][188] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][190] ([Intel XE#1124]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][191] ([Intel XE#1467]) -> [SKIP][192] ([Intel XE#2351])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][194] ([Intel XE#367]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#367]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#787]) +27 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#787]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][202] ([Intel XE#1252])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][207] ([Intel XE#314]) -> [SKIP][208] ([Intel XE#2351])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][210] ([Intel XE#373]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][212] ([Intel XE#306])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#373]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][216] ([Intel XE#307])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][218] ([Intel XE#308]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#308]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#308])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][222] ([Intel XE#455]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#455]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][226] ([Intel XE#651]) +13 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][227] ([Intel XE#656]) -> [SKIP][228] ([Intel XE#2351]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#651]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][232] ([Intel XE#653]) +14 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#653]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#498]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][240] ([Intel XE#870])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [FAIL][241] ([Intel XE#2749]) -> [SKIP][242] ([Intel XE#2351]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-lnl:          [FAIL][243] ([Intel XE#2605]) -> [FAIL][244] ([Intel XE#2605] / [Intel XE#2749])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-7/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1489]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#1489])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][248] ([Intel XE#1489]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][250] ([Intel XE#929]) +8 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-lnl:          [WARN][251] ([Intel XE#2748]) -> [SKIP][252] ([Intel XE#2351]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_psr@psr2-basic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#929]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr@psr2-dpms.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][256] ([Intel XE#327])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][258] ([Intel XE#1127])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][260] ([Intel XE#756])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1123]) -> [SKIP][262] ([Intel XE#1123] / [Intel XE#1201])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][264] ([Intel XE#288]) +12 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#288]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2541]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][270] ([Intel XE#2541]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][272] ([Intel XE#2284] / [Intel XE#366])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][274] ([Intel XE#944])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#944]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#944])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1332
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2605
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2716]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2716
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2748
  [Intel XE#2749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 -> xe-pw-138535v1

  IGT_8012: 8012
  xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3: f3eded4f8a05d73a0b94f27e05737ea3427450b3
  xe-pw-138535v1: 138535v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/index.html

--===============2957474350865685723==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/4] drm/xe/client: fix deadlock in show_meminfo()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138535/">https://patchwork.freedesktop.org/series/138535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_full -&gt; xe-pw-138535v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138535v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138535v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138535v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138535v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_draw_crc@draw-method-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1332">Intel XE#1332</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749">Intel XE#2749</a>) +4 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-7/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749">Intel XE#2749</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2748">Intel XE#2748</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2748">Intel XE#2748</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_exec_store@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_exec_store@basic-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-6/igt@kms_flip@absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-8/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-435/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-435/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749">Intel XE#2749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2605">Intel XE#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-7/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2605">Intel XE#2605</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749">Intel XE#2749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-lnl-4/igt@kms_psr@psr2-basic.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2748">Intel XE#2748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-lnl-3/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138535v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 -&gt; xe-pw-138535v1</li>
</ul>
<p>IGT_8012: 8012<br />
  xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3: f3eded4f8a05d73a0b94f27e05737ea3427450b3<br />
  xe-pw-138535v1: 138535v1</p>

</body>
</html>

--===============2957474350865685723==--
