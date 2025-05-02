Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B96C3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 15:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14110E944;
	Fri,  2 May 2025 15:21:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FB110E063;
 Fri,  2 May 2025 15:21:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6048766931767939471=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Update_migration?=
 =?utf-8?q?_tests=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 15:21:25 -0000
Message-ID: <174619928584.35889.9157261428014321779@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502093514.510621-1-dev@lankhorst.se>
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
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

--===============6048766931767939471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Update migration tests.
URL   : https://patchwork.freedesktop.org/series/148544/
State : failure

== Summary ==

CI Bug Log - changes from xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_FULL -> xe-pw-148544v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148544v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148544v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148544v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html

  * {igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit} (NEW):
    - shard-adlp:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - shard-bmg:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html
    - shard-lnl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@xe_module_load@reload-no-display.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27_FULL and xe-pw-148544v1_FULL:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.10, 0.49] s

  

Known issues
------------

  Here are the changes found in xe-pw-148544v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#3767]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#873])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#4208] / [i915#2575]) +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +209 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2724])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4416]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2325])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#307])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#1178]) +2 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1188])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#308])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2291]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#1340])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4354])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#4156])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#702])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_feature_discovery@display-2x.html
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2373])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#3321]) +7 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#301]) +5 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#301])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2316]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#310])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][70] -> [INCOMPLETE][71] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [PASS][72] -> [DMESG-WARN][73] ([Intel XE#4173])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#2882]) +4 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401] / [Intel XE#1745])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +13 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4141]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#651])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#656]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#653]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2312]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2313]) +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#455])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2925])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2501])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#616]) +2 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#4596])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2493])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2571])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2763]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#870])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1489])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1489]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2893])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1489])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2387])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3414] / [Intel XE#3904])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1127])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#1435])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3428]) +1 other test dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#455]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#756])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1091] / [Intel XE#2849])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#3576])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4837]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#4837])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4837])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4837])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#261] / [Intel XE#688])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#688])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1392])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1392])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2322]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#1392]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#288]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#288])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4943]) +8 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4915]) +30 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4943]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4915]) +14 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][141] -> [FAIL][142] ([Intel XE#2909])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2457])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#2541] / [Intel XE#3573])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2541] / [Intel XE#3573])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#2284] / [Intel XE#366])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][147] -> [ABORT][148] ([Intel XE#1794]) +1 other test abort
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#579])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#4733])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4733]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_vm@large-binds-8388608:
    - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#4208]) +25 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_vm@large-binds-8388608.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_vm@large-binds-8388608.html

  
#### Possible fixes ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#4543]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_async_flips@invalid-async-flip-atomic.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#3862]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][160] ([Intel XE#2291]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][162] ([Intel XE#1475]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][164] ([Intel XE#4354]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#301]) -> [PASS][167] +6 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][168] ([Intel XE#2316]) -> [PASS][169] +9 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][172] ([Intel XE#3321]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][174] ([Intel XE#301]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][176] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][177] +3 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [FAIL][178] ([Intel XE#886]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][180] ([Intel XE#1503]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][182] ([Intel XE#4596]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][184] ([Intel XE#1435]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][186] ([Intel XE#1499]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1392]) -> [PASS][189] +8 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:
    - shard-bmg:          [DMESG-WARN][190] ([Intel XE#3428]) -> [PASS][191] +7 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][192] -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [SKIP][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219]) ([Intel XE#378]) -> ([PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-9/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-9/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [DMESG-FAIL][245] ([Intel XE#3428]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_pm@d3hot-mocs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][247] ([Intel XE#1794]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-9/igt@xe_pm@s4-basic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][249] ([Intel XE#1794]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#316]) -> [SKIP][252] ([Intel XE#4208])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124]) -> [SKIP][254] ([Intel XE#4208]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2191]) -> [SKIP][256] ([Intel XE#4208] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][258] ([Intel XE#4208]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2907]) -> [SKIP][260] ([Intel XE#4208])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][261] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][262] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][263] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][264] ([Intel XE#1727] / [Intel XE#3113])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#306]) -> [SKIP][266] ([Intel XE#4208] / [i915#2575])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#373]) -> [SKIP][268] ([Intel XE#4208] / [i915#2575])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][269] ([Intel XE#2341]) -> [FAIL][270] ([Intel XE#1178])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_content_protection@atomic.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [DMESG-FAIL][271] ([Intel XE#3428]) -> [SKIP][272] ([Intel XE#2341])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_content_protection@srm.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#455]) -> [SKIP][274] ([Intel XE#4208])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][275] -> [SKIP][276] ([Intel XE#4294])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][277] ([Intel XE#2882]) -> [SKIP][278] ([Intel XE#2316])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][279] ([Intel XE#2316]) -> [FAIL][280] ([Intel XE#3321]) +1 other test fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][281] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][282] ([Intel XE#2316])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#651]) -> [SKIP][284] ([Intel XE#2351] / [Intel XE#4208])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#651]) -> [SKIP][286] ([Intel XE#4208]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][287] ([Intel XE#2311]) -> [SKIP][288] ([Intel XE#2312]) +22 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][289] ([Intel XE#2312]) -> [SKIP][290] ([Intel XE#4141]) +9 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][291] ([Intel XE#4141]) -> [SKIP][292] ([Intel XE#2312]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][293] ([Intel XE#2312]) -> [SKIP][294] ([Intel XE#2311]) +18 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#653]) -> [SKIP][296] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#2313]) -> [SKIP][298] ([Intel XE#2312]) +28 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2313]) +17 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#653]) -> [SKIP][302] ([Intel XE#4208]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][303] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][304] ([Intel XE#3544])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][305] ([Intel XE#4596]) -> [SKIP][306] ([Intel XE#2493])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1489]) -> [SKIP][308] ([Intel XE#4208]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][310] ([Intel XE#4208]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][312] ([Intel XE#2351] / [Intel XE#4208])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4497]) -> [SKIP][314] ([Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_eu_stall@blocking-read.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4837]) -> [SKIP][316] ([Intel XE#4208]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#288]) -> [SKIP][318] ([Intel XE#4208]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#4915]) -> [SKIP][320] ([Intel XE#4208]) +23 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_exec_system_allocator@process-many-free-race-nomemset.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_system_allocator@process-many-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][321] ([Intel XE#4929]) -> [FAIL][322] ([Intel XE#4929] / [Intel XE#4937])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][323], [PASS][324], [PASS][325], [DMESG-WARN][326], [PASS][327], [PASS][328], [PASS][329], [SKIP][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [SKIP][372], [PASS][373], [PASS][374]) ([Intel XE#2457])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-2/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-2/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-2/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][376] ([Intel XE#4208])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_oa@short-reads.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_oa@short-reads.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4650]) -> [SKIP][378] ([Intel XE#4208])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#944]) -> [SKIP][380] ([Intel XE#4208])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2909
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27 -> xe-pw-148544v1

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27: d191d21d3ce573759a1a2f82443d3bf8e23b7b27
  xe-pw-148544v1: 148544v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/index.html

--===============6048766931767939471==
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
<tr><td><b>Series:</b></td><td>drm/xe: Update migration tests.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148544/">https://patchwork.freedesktop.org/series/148544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148544v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148544v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3025-d191d21d3ce573759a1a2f82443d3bf8e=
23b7b27_FULL -&gt; xe-pw-148544v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148544v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148544v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1485=
44v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@xe_liv=
e_ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate=
.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit} (NEW):</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_=
migrate_performance_kunit.html">SKIP</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_m=
igrate_performance_kunit.html">FAIL</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe=
_migrate_performance_kunit.html">FAIL</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_m=
igrate_performance_kunit.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3025-d191d21d3ce573759a1a2f824=
43d3bf8e23b7b27_FULL and xe-pw-148544v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_performance_kunit:<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.10, 0.49] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148544v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a=
-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#376=
7</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_at=
omic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_atomic@=
plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#=
367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +209 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-aft=
er-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-434/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +7 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank@bc-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_flip@fl=
ip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@kms_flip@flip-vs=
-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_=
flip@plain-flip-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +=
4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sha=
rd-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_vbla=
nk@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_vblank@ts-cont=
inuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_eudebug@discovery-race-vm=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_eudebug@multigpu-basic-cli=
ent-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_eudebug_online@basic-bre=
akpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_evict@evict-beng-small-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-=
432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_exec_system_allocator@many=
-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +30 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nom=
emset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-2/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2909">Intel XE#2909</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_oa@oa-regs-whitelisted.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-8388608:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_vm@=
large-binds-8388608.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_vm@large-binds-83886=
08.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@kms_asy=
nc_flips@invalid-async-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-=
adlp-2/igt@kms_async_flips@invalid-async-flip-atomic.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-4=
33/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148544v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sha=
rd-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/i=
gt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
44v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-3/igt@kms_flip=
@plain-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-8/igt@km=
s_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148544v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_exec_=
system_allocator@many-stride-new-bo-map-nomemset.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3=
428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48544v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-bo-map-nom=
emset.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
544v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-strid=
e-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b2=
7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e2=
3b7b27/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3=
bf8e23b7b27/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82=
443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1=
a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573=
759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3=
ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191=
d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025=
-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b2=
7/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e2=
3b7b27/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3=
bf8e23b7b27/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82=
443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1=
a2f82443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573=
759a1a2f82443d3bf8e23b7b27/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148544v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
44v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148544v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148544v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544=
v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148544v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48544v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148544v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_pm@d3=
hot-mocs.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_pm@d3hot-mocs=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-adlp-9/igt@xe_pm@s=
4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148544v1/shard-adlp-4/igt@xe_pm@s4-basic.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-lnl-1/igt@xe_pm@s4-vm-=
bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@km=
s_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@=
kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/=
shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-4=
64/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148544v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@k=
ms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/=
igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_di=
rtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@kms_di=
rtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/sh=
ard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-=
bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#25=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8544v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">=
Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14854=
4v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148544v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148544v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148544v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48544v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48544v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
44v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-=
dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ps=
r2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v=
1/shard-dg2-464/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ps=
r@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg=
2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-=
464/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_eu_=
stall@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_eu_sta=
ll@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@=
xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-=
bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_exe=
c_system_allocator@process-many-free-race-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
44v1/shard-dg2-464/igt@xe_exec_system_allocator@process-many-free-race-nome=
mset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929"=
>Intel XE#4929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148544v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4929">Intel XE#4929</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-6=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/s=
hard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b=
27/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e2=
3b7b27/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3b=
f8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f8244=
3d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2=
f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759=
a1a2f82443d3bf8e23b7b27/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce57=
3759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3=
ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d=
21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d=
191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-30=
25-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b=
7b27/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3025-d191d21d3ce573759a1a2f82443d3bf8=
e23b7b27/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel=
 XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148544v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148544v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148544v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1=
/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148544v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#245=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_oa@=
short-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_=
oa@short-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27/shard-dg2-464/igt@xe_que=
ry@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148544v1/shard-dg2-464/igt@xe_=
query@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27 -&gt; xe-pw-148=
544v1</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3025-d191d21d3ce573759a1a2f82443d3bf8e23b7b27: d191d21d3ce573759a1a2f8=
2443d3bf8e23b7b27<br />
  xe-pw-148544v1: 148544v1</p>

</body>
</html>

--===============6048766931767939471==--
