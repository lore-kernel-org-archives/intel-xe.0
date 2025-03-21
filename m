Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C6C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 15:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB02510E167;
	Fri, 21 Mar 2025 15:56:23 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A718810E162;
 Fri, 21 Mar 2025 15:56:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7773280551253218941=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Simplify_pinned_?=
 =?utf-8?q?bo_iteration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 15:56:22 -0000
Message-ID: <174257258265.65138.6001448777445797600@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
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

--===============7773280551253218941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Simplify pinned bo iteration (rev2)
URL   : https://patchwork.freedesktop.org/series/146586/
State : failure

== Summary ==

CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396_full -> xe-pw-146586v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146586v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146586v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146586v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_eu_stall@blocking-read:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-2/igt@xe_eu_stall@blocking-read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-6/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  
Known issues
------------

  Here are the changes found in xe-pw-146586v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#3746] / [Intel XE#827])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#873])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3908]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +137 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#3124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4416]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2325]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2390])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2286]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#309]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#1340])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4354])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2244])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4422])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4156])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#776])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2372])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2374])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#310]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_flip@2x-flip-vs-dpms.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#3321]) +4 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][59] -> [FAIL][60] ([Intel XE#3321]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][63] -> [FAIL][64] ([Intel XE#886]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#301]) +3 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311]) +20 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#656]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +10 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +12 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#658])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +10 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2352])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +22 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#346])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2934])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2393])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#870])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2505])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1489]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1489]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2387]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2414])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3414])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2413])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2450])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2168])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#4459]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1091] / [Intel XE#2849])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2905]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2905]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1392]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#1392]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2833])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131]) -> ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [SKIP][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157]) ([Intel XE#378])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-463/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_oa@missing-sample-flags.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2245])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2284])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][161] -> [DMESG-WARN][162] ([Intel XE#4173])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#579])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#944]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#944])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][166] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][168] ([Intel XE#2291]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#309]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#301]) -> [PASS][175] +2 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][176] ([Intel XE#3321]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#310]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][180] ([Intel XE#2316]) -> [PASS][181] +4 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][182] ([Intel XE#886]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][184] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#656]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [INCOMPLETE][188] -> [PASS][189] +3 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][190] ([Intel XE#1435]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1392]) -> [PASS][193] +5 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][195] ([Intel XE#787]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#787]) -> [SKIP][197] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#4418]) -> [SKIP][199] ([Intel XE#4440])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#1188]) -> [SKIP][201] ([Intel XE#455])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_content_protection@uevent.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2311]) +11 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#651]) -> [SKIP][205] ([Intel XE#656]) +10 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][206] ([Intel XE#4141]) -> [SKIP][207] ([Intel XE#2312]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][208] ([Intel XE#2312]) -> [SKIP][209] ([Intel XE#4141]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][210] ([Intel XE#2311]) -> [SKIP][211] ([Intel XE#2312]) +10 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#656]) -> [SKIP][213] ([Intel XE#651]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][214] ([Intel XE#2313]) -> [SKIP][215] ([Intel XE#2312]) +12 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][216] ([Intel XE#2312]) -> [SKIP][217] ([Intel XE#2313]) +14 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#656]) -> [SKIP][219] ([Intel XE#653]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#653]) -> [SKIP][221] ([Intel XE#656]) +12 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][222] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][223] ([Intel XE#3544])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#1729]) -> [SKIP][225] ([Intel XE#362])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1500]) -> [SKIP][227] ([Intel XE#362])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][228] ([Intel XE#1173]) -> [SKIP][229] ([Intel XE#1061])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_peer2peer@write.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_peer2peer@write.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -> xe-pw-146586v2

  IGT_8277: 8277
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a622c5a8c5458e2396
  xe-pw-146586v2: 146586v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/index.html

--===============7773280551253218941==
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
<tr><td><b>Series:</b></td><td>drm/xe: Simplify pinned bo iteration (rev2)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146586/">https://patchwork.freedesktop.org/series/146586/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146586v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146586v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c54=
58e2396_full -&gt; xe-pw-146586v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146586v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-146586v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1465=
86v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-2/igt@xe_eu_st=
all@blocking-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-146586v2/shard-lnl-6/igt@xe_eu_stall@blocking-read.h=
tml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_eudebug_online@set-break=
point-sigint-debugger.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146586v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-2/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel =
XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bm=
g-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
46">Intel XE#3746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-6/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-6/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adl=
p-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +137 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-43=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_chamelium_frames@hdmi-c=
mp-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/igt@kms_flip@2x-fl=
ip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@kms=
_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-8/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-3/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-2/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-9/igt@kms_flip@flip-v=
s-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/sha=
rd-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_psr@psr2-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-146586v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_exec_basic@=
multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c545=
8e2396/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5=
a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f4=
7a622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c=
2986f47a622c5a8c5458e2396/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713=
d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15=
a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-28=
32-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e=
2396/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8=
c5458e2396/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a6=
22c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c298=
6f47a622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14=
b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87=
713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-=
b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146586v2/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/sh=
ard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-466/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-146586v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46586v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146586v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-=
432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146586v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/=
shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2=
-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146586v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_oa@missing-sample-flags.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146586v2/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-u=
serptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-bmg-3/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146586v2/shard-dg2-433/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146586v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2=
291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46586v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cu=
rsor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/s=
hard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146586v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146586v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ac-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_fl=
ip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_flip@2=
x-nonexisting-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-7/igt@km=
s_flip@2x-plain-flip-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-lnl-7/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-lnl-8/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2=
/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46586v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_jo=
iner@basic-force-big-joiner.html">INCOMPLETE</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@kms_joine=
r@basic-force-big-joiner.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-1/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146586v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen=
12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146586v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/igt@kms_c=
ontent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1465=
86v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6586v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146586v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6586v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146586v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46586v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586=
v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-bmg-6/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-464/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/shard-dg2-435/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146586v2/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -&gt; xe-pw-146=
586v2</li>
</ul>
<p>IGT_8277: 8277<br />
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a=
622c5a8c5458e2396<br />
  xe-pw-146586v2: 146586v2</p>

</body>
</html>

--===============7773280551253218941==--
