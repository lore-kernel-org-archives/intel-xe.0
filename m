Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDCDC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 07:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132810E44C;
	Tue, 23 Jul 2024 07:00:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706C110E44C;
 Tue, 23 Jul 2024 07:00:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5534620796628740996=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Refactor_mmio_setup_f?=
 =?utf-8?q?or_multi-tile_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 07:00:40 -0000
Message-ID: <172171804044.359018.7826758350718017920@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723045558.288693-1-lucas.demarchi@intel.com>
In-Reply-To: <20240723045558.288693-1-lucas.demarchi@intel.com>
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

--===============5534620796628740996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Refactor mmio setup for multi-tile (rev2)
URL   : https://patchwork.freedesktop.org/series/136159/
State : failure

== Summary ==

CI Bug Log - changes from xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_full -> xe-pw-136159v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136159v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136159v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136159v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-lnl:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-8/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1201]) -> [SKIP][12] +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:
    - shard-lnl:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-136159v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1033] / [Intel XE#2338])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          NOTRUN -> [FAIL][19] ([Intel XE#1701]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1426])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1195]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1407])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#1659])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1204])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#316])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#787]) +32 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1399]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#308])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1413]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#701])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1638]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1874]) +3 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#656]) +16 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#1861])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#656]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#651]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#1339])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#417])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#324])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#599]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#455]) +18 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#498]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#734])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1439])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1489])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1437]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][86] -> [FAIL][87] ([Intel XE#899])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#899]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#688])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#688]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1392]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_reset@close-fd:
    - shard-lnl:          NOTRUN -> [ABORT][100] ([Intel XE#2271] / [Intel XE#2309])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_exec_reset@close-fd.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2256])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@xe_gt_freq@freq_fixed_exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-adlp:         [PASS][103] -> [FAIL][104] ([Intel XE#2203])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-8/igt@xe_gt_freq@freq_range_exec.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#378])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_module_load@force-load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#1337])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#979])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1061] / [Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#584])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][110] ([Intel XE#1551] / [Intel XE#569])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][111] -> [ABORT][112] ([Intel XE#1358] / [Intel XE#1794])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#944]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-random@render-ymajor-256x256:
    - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#2226]) +2 other tests dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-1/igt@xe_render_copy@render-random@render-ymajor-256x256.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_render_copy@render-random@render-ymajor-256x256.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - shard-dg2-set2:     [PASS][117] -> [ABORT][118] ([Intel XE#2271])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
    - shard-lnl:          [PASS][119] -> [ABORT][120] ([Intel XE#2271])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [DMESG-WARN][121] ([Intel XE#877]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][123] ([Intel XE#886]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][125] ([Intel XE#1874]) -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [DMESG-WARN][127] ([Intel XE#2052]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * {igt@kms_plane@plane-position-hole@pipe-a-plane-2}:
    - shard-lnl:          [DMESG-FAIL][129] ([Intel XE#324]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * {igt@kms_plane@plane-position-hole@pipe-b-plane-2}:
    - shard-lnl:          [DMESG-WARN][131] ([Intel XE#324]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#361]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#771] / [Intel XE#899]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][137] ([Intel XE#899]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#899]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [INCOMPLETE][141] -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][143] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [ABORT][145] ([Intel XE#2271]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [ABORT][147] ([Intel XE#2271]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][149] ([Intel XE#1794]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][151] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][154] ([Intel XE#316]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][155] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][156] ([Intel XE#324])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][157] ([Intel XE#1231]) -> [DMESG-FAIL][158] ([Intel XE#324])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1124]) -> [SKIP][160] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][162] ([Intel XE#1124]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#367]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#367])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#787]) +48 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][168] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#787]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][174] ([Intel XE#314])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1152]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#306]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#306])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][180] ([Intel XE#306])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][182] ([Intel XE#373]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-fast.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#373]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#307]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#307])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][188] ([Intel XE#308])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#323]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#323])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#455]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][194] ([Intel XE#307])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1138])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][198] ([Intel XE#1137])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][200] ([Intel XE#455]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][202] ([Intel XE#651]) +18 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#651]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-adlp:         [ABORT][205] -> [SKIP][206] ([Intel XE#1201] / [Intel XE#656])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][208] ([Intel XE#658])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1158]) -> [SKIP][210] ([Intel XE#1158] / [Intel XE#1201])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#653]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][214] ([Intel XE#653]) +17 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][216] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][218] ([Intel XE#498]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][223] -> [SKIP][224] ([Intel XE#1201]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][226] ([Intel XE#870])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1489]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#1489])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][230] ([Intel XE#1489]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1122])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#929]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][236] ([Intel XE#929]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1127]) -> [SKIP][238] ([Intel XE#1127] / [Intel XE#1201])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][240] ([Intel XE#327])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][242] ([Intel XE#756])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][244] ([Intel XE#1091])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][246] ([Intel XE#1123])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1126]) -> [SKIP][248] ([Intel XE#1126] / [Intel XE#1201])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][250] ([Intel XE#288]) +14 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#288]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][254] ([Intel XE#1551] / [Intel XE#569])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][256] ([Intel XE#944]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#944]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-FAIL][259] ([Intel XE#1760]) -> [DMESG-WARN][260] ([Intel XE#1760])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256
  [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
  [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2339
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
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
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b -> xe-pw-136159v2

  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
  xe-pw-136159v2: 136159v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/index.html

--===============5534620796628740996==
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
<tr><td><b>Series:</b></td><td>drm/xe: Refactor mmio setup for multi-tile (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136159/">https://patchwork.freedesktop.org/series/136159/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_full -&gt; xe-pw-136159v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136159v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136159v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136159v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-8/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136159v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_flip@flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_flip@flip-vs-modeset-vs-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_evict@evict-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_exec_reset@close-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309">Intel XE#2309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256">Intel XE#2256</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-8/igt@xe_gt_freq@freq_range_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-random@render-ymajor-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-1/igt@xe_render_copy@render-random@render-ymajor-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@xe_render_copy@render-random@render-ymajor-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-3/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052">Intel XE#2052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-a-plane-2}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-plane-2}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136159v2/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b -&gt; xe-pw-136159v2</li>
</ul>
<p>IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b<br />
  xe-pw-136159v2: 136159v2</p>

</body>
</html>

--===============5534620796628740996==--
