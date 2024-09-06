Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F61E6FE46
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 20:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A2D10E12B;
	Fri,  6 Sep 2024 20:32:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3610E0D1;
 Fri,  6 Sep 2024 20:32:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8609773125034325925=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Suppress_missing_oute?=
 =?utf-8?q?r_rpm_protection_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 20:32:53 -0000
Message-ID: <172565477323.955479.8792273046590166706@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904165116.22829-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240904165116.22829-1-rodrigo.vivi@intel.com>
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

--===============8609773125034325925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Suppress missing outer rpm protection warning
URL   : https://patchwork.freedesktop.org/series/138220/
State : failure

== Summary ==

CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_full -> xe-pw-138220v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138220v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138220v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138220v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][1], [PASS][2]) -> [INCOMPLETE][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         ([PASS][4], [PASS][5]) -> [FAIL][6]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@xe_drm_fdinfo@utilization-others-full-load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cdclk@mode-transition:
    - {shard-bmg}:        ([FAIL][7], [FAIL][8]) ([Intel XE#2435]) -> [SKIP][9]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_cdclk@mode-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        ([SKIP][10], [SKIP][11]) ([Intel XE#314]) -> [SKIP][12]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - {shard-bmg}:        ([FAIL][13], [FAIL][14]) ([Intel XE#2429]) -> [SKIP][15]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - {shard-bmg}:        ([PASS][16], [PASS][17]) -> [INCOMPLETE][18] +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  
Known issues
------------

  Here are the changes found in xe-pw-138220v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][19], [PASS][20]) -> [FAIL][21] ([Intel XE#1231])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         ([PASS][22], [PASS][23]) -> [FAIL][24] ([Intel XE#1874]) +9 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     ([PASS][25], [PASS][26]) -> [INCOMPLETE][27] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     ([PASS][28], [PASS][29]) -> [INCOMPLETE][30] ([Intel XE#1195] / [Intel XE#2049])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         ([PASS][31], [PASS][32]) -> [FAIL][33] ([Intel XE#1861])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          ([PASS][34], [PASS][35]) -> [INCOMPLETE][36] ([Intel XE#2050])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     ([PASS][37], [PASS][38]) -> [INCOMPLETE][39] ([Intel XE#2622])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          ([PASS][40], [PASS][41]) -> [DMESG-FAIL][42] ([Intel XE#324]) +2 other tests dmesg-fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-3:
    - shard-lnl:          ([PASS][43], [PASS][44]) -> [DMESG-WARN][45] ([Intel XE#324])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#1430])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#899])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#1523]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          ([PASS][52], [PASS][53]) -> [SKIP][54] ([Intel XE#1192])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     ([PASS][55], [PASS][56]) -> [FAIL][57] ([Intel XE#2136])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_module_load@reload.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_module_load@reload.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][58] -> [ABORT][59] ([Intel XE#1358] / [Intel XE#1607])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([PASS][60], [DMESG-WARN][61]) ([Intel XE#1033]) -> [PASS][62] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          ([FAIL][63], [PASS][64]) ([Intel XE#1426]) -> [PASS][65] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        ([PASS][66], [FAIL][67]) ([Intel XE#1426]) -> [PASS][68] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([FAIL][69], [PASS][70]) ([Intel XE#1426]) -> [PASS][71] +3 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         ([FAIL][72], [PASS][73]) ([Intel XE#1426]) -> [PASS][74] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][75] ([Intel XE#1659]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][77], [FAIL][78]) ([Intel XE#1231]) -> [PASS][79] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][80] ([Intel XE#1874]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][82] ([Intel XE#1204]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([DMESG-FAIL][84], [FAIL][85]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][86]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([FAIL][87], [FAIL][88]) ([Intel XE#1874]) -> [PASS][89] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][90] ([Intel XE#2436]) -> [PASS][91] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        ([DMESG-WARN][92], [DMESG-WARN][93]) ([Intel XE#877]) -> [PASS][94]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          ([FAIL][95], [PASS][96]) ([Intel XE#2668]) -> [PASS][97]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-panning@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][98] ([Intel XE#877]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning@ab-dp2-hdmi-a3.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          ([FAIL][100], [PASS][101]) ([Intel XE#886]) -> [PASS][102] +5 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         ([FAIL][103], [FAIL][104]) ([Intel XE#1861]) -> [PASS][105] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     ([DMESG-WARN][106], [DMESG-WARN][107]) ([Intel XE#2019]) -> [PASS][108]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - {shard-bmg}:        ([PASS][109], [DMESG-WARN][110]) ([Intel XE#877]) -> [PASS][111] +14 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][112] ([Intel XE#899]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        ([PASS][114], [FAIL][115]) ([Intel XE#899]) -> [PASS][116] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][117] ([Intel XE#899]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        ([PASS][119], [TIMEOUT][120]) ([Intel XE#1473]) -> [PASS][121]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][122], [TIMEOUT][123]) ([Intel XE#1473]) -> [PASS][124]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][125] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         ([PASS][127], [DMESG-WARN][128]) ([Intel XE#2046]) -> [PASS][129]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_oa@mmio-triggered-reports:
    - {shard-bmg}:        ([FAIL][130], [FAIL][131]) ([Intel XE#2249]) -> [PASS][132]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          ([FAIL][133], [FAIL][134]) ([Intel XE#2249]) -> [PASS][135]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          [FAIL][136] ([Intel XE#2249]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - {shard-bmg}:        [FAIL][138] ([Intel XE#2249]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@rcs-0.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          ([FAIL][140], [FAIL][141]) ([Intel XE#2514]) -> [PASS][142] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
    - {shard-bmg}:        ([FAIL][143], [FAIL][144]) ([Intel XE#2514]) -> [PASS][145]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-lnl:          ([DMESG-FAIL][146], [PASS][147]) ([Intel XE#1620]) -> [PASS][148] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_pm@d3hot-mmap-system.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-bmg}:        ([INCOMPLETE][149], [PASS][150]) ([Intel XE#1616]) -> [PASS][151]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
    - shard-dg2-set2:     ([PASS][152], [INCOMPLETE][153]) ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][154]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic:
    - {shard-bmg}:        ([DMESG-WARN][155], [PASS][156]) ([Intel XE#569] / [Intel XE#877]) -> [PASS][157]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_pm@s3-basic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_pm@s3-basic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         ([ABORT][158], [PASS][159]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][160]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s4-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          ([ABORT][161], [PASS][162]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][163] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         ([PASS][164], [ABORT][165]) ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][166]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          ([PASS][167], [ABORT][168]) ([Intel XE#1794]) -> [PASS][169]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     ([FAIL][170], [FAIL][171]) ([Intel XE#2710]) -> [PASS][172] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm_residency@idle-residency.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm_residency@idle-residency.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-433/igt@xe_pm_residency@idle-residency.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][173], [SKIP][174]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][175] ([Intel XE#316]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][176] ([Intel XE#1204]) -> [DMESG-FAIL][177] ([Intel XE#324])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         ([DMESG-FAIL][178], [FAIL][179]) ([Intel XE#1204] / [Intel XE#324]) -> [FAIL][180] ([Intel XE#1204])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][181], [DMESG-FAIL][182]) ([Intel XE#1231] / [Intel XE#324]) -> [FAIL][183] ([Intel XE#1231]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     ([SKIP][184], [SKIP][185]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1124]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     ([SKIP][187], [SKIP][188]) ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][189] ([Intel XE#2191]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     ([SKIP][190], [SKIP][191]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][192] ([Intel XE#367])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][193], [SKIP][194]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][195] ([Intel XE#787]) +62 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     ([SKIP][196], [SKIP][197]) ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][198] ([Intel XE#1252])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     ([SKIP][199], [SKIP][200]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][201] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     ([SKIP][202], [SKIP][203]) ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][204] ([Intel XE#306])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     ([SKIP][205], [SKIP][206]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][207] ([Intel XE#373]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@mei-interface:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][209] ([Intel XE#1201])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_content_protection@mei-interface.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][211] ([Intel XE#308])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     ([SKIP][212], [SKIP][213]) ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][214] ([Intel XE#323]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][215], [SKIP][216]) ([Intel XE#1201] / [i915#3804]) -> [SKIP][217] ([i915#3804])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     ([SKIP][218], [SKIP][219]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#455]) +10 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     ([SKIP][221], [SKIP][222]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][223] ([Intel XE#651]) +19 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][225] ([Intel XE#651])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][227] ([Intel XE#653])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][229] ([Intel XE#455])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     ([SKIP][230], [SKIP][231]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][232] ([Intel XE#653]) +19 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][233], [SKIP][234]) ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][235] ([Intel XE#2318]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][236], [SKIP][237]) ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][238] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     ([SKIP][239], [SKIP][240]) ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][241] ([Intel XE#1122]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     ([SKIP][242], [SKIP][243]) ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][244] ([Intel XE#1489])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     ([SKIP][245], [SKIP][246]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][247] ([Intel XE#929]) +7 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     ([SKIP][248], [SKIP][249]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][250] ([Intel XE#327])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     ([SKIP][251], [SKIP][252]) ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][253] ([Intel XE#1127])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     ([SKIP][254], [SKIP][255]) ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][256] ([Intel XE#756])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][257], [PASS][258]) ([Intel XE#1473] / [Intel XE#402]) -> [TIMEOUT][259] ([Intel XE#1473] / [Intel XE#402])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][261] ([Intel XE#288])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     ([SKIP][262], [SKIP][263]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][264] ([Intel XE#288]) +16 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     ([SKIP][265], [SKIP][266]) ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][267] ([Intel XE#2360])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][268] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][269] ([Intel XE#1961] / [Intel XE#2026])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_module_load@many-reload.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     ([SKIP][270], [SKIP][271]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][272] ([Intel XE#2541]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_oa@mi-rpc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_oa@mi-rpc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][274] ([Intel XE#2541])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][275], [FAIL][276]) ([Intel XE#958]) -> [FAIL][277] ([Intel XE#958])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     ([SKIP][278], [SKIP][279]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][280] ([Intel XE#944]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2668]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2668
  [Intel XE#2710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2710
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8004 -> IGT_8005
  * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-pw-138220v1

  IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
  xe-pw-138220v1: 138220v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/index.html

--===============8609773125034325925==
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
<tr><td><b>Series:</b></td><td>drm/xe: Suppress missing outer rpm protectio=
n warning</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/138220/">https://patchwork.freedesktop.org/series/138220/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138220v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138220v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c35966689=
91c67ea_full -&gt; xe-pw-138220v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138220v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-138220v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1382=
20v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_p=
ipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3=
596668991c67ea/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c=
-hdmi-a-6.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-=
crc@pipe-c-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_drm=
_fdinfo@utilization-others-full-load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c=
67ea/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
20v1/shard-adlp-1/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL=
</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_cdc=
lk@mode-transition.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/i=
gt@kms_cdclk@mode-transition.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2435">Intel XE#2435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-3/igt@k=
ms_cdclk@mode-transition.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cdc=
lk@mode-transition-all-outputs.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
20v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_cdc=
lk@plane-scaling.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt=
@kms_cdclk@plane-scaling.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2429">Intel XE#2429</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-5/igt@kms_c=
dclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b710=
24de6f80c3596668991c67ea/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-downscaling.html">PASS</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-2/igt@kms_flip_scale=
d_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">INCOMPLETE</a> +1 o=
ther test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138220v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b7=
1024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">PASS</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_big_f=
b@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#=
1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_f=
lip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-43=
6/igt@kms_flip@flip-vs-suspend.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-466/igt@kms_flip@fl=
ip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_f=
lip@flip-vs-suspend@d-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-466/igt=
@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-shrfb-pgflip-blt.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-8/igt@kms_frontbuffer_trackin=
g@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sh=
ard-lnl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl=
-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_p=
ipe_crc_basic@suspend-read-crc.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-d=
g2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#262=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_pla=
ne@plane-position-hole.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl=
-1/igt@kms_plane@plane-position-hole.html">PASS</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@kms_pla=
ne@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_pla=
ne@plane-position-hole@pipe-b-plane-3.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">PA=
SS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
8220v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-138220v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel X=
E#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-9/igt@=
kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_vbla=
nk@accuracy-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-138220v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_live=
_ktest@xe_dma_buf.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/ig=
t@xe_live_ktest@xe_dma_buf.html">PASS</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_live_ktest@xe_=
dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_mo=
dule_load@reload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/i=
gt@xe_module_load@reload.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-436/igt@xe_module_load@re=
load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-138220v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a>)</li>
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
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308=
b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sh=
ard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3=
ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_atomic_transition@p=
lane-all-modeset-transition-fencing-internal-panels.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#142=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138=
220v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b7102=
4de6f80c3596668991c67ea/shard-bmg-5/igt@kms_atomic_transition@plane-all-mod=
eset-transition@pipe-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@km=
s_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_a=
tomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc030=
8b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_atomic_transition@plane=
-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-=
dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-=
a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_at=
omic_transition@plane-toggle-modeset-transition.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset=
-transition.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_atomic_transi=
tion@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/s=
hard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de=
6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/=
shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel X=
E#1204</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138220v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0=
-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc=
0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw=
-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#32=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138=
220v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@kms_big_fb@=
y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
20v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c=
-dp-2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DM=
ESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-138220v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fbc=
on_fbt@fbc-suspend.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/i=
gt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2668">Intel XE#2668</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-8/igt@k=
ms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-panning@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bm=
g-3/igt@kms_flip@2x-flip-vs-panning@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fli=
p@flip-vs-absolute-wf_vblank.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sha=
rd-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220=
v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_fr=
ontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966=
68991c67ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimar=
y.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1861">Intel XE#1861</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-138220v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
c-shrfb-scaledprimary.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WA=
RN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/201=
9">Intel XE#2019</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138220v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">DM=
ESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-138220v1/shard-bmg-8/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_univ=
ersal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-6/igt@kms_un=
iversal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-dp-2.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966689=
91c67ea/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138220v1/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard=
-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_evic=
t@evict-beng-mixed-threads-large.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea=
/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Inte=
l XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-138220v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_ev=
ict@evict-mixed-many-threads-small.html">TIMEOUT</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEO=
UT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/147=
3">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138220v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_evict=
@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sha=
rd-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_exe=
c_reset@gt-reset-stress.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-ad=
lp-6/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2046">Intel XE#2046</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/s=
hard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@m=
mio-triggered-reports.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-=
8/igt@xe_oa@mmio-triggered-reports.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@m=
mio-triggered-reports.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-=
4/igt@xe_oa@mmio-triggered-reports.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mm=
io-triggered-reports@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/igt@xe_o=
a@mmio-triggered-reports@ccs-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mm=
io-triggered-reports@rcs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@xe_o=
a@mmio-triggered-reports@rcs-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_oa@o=
a-regs-whitelisted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/i=
gt@xe_oa@oa-regs-whitelisted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-5/igt@x=
e_oa@oa-regs-whitelisted.html">PASS</a> +1 other test pass</li>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@o=
a-regs-whitelisted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/i=
gt@xe_oa@oa-regs-whitelisted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-7/igt@x=
e_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@d=
3hot-mmap-system.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl=
-3/igt@xe_pm@d3hot-mmap-system.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-3/ig=
t@xe_pm@d3hot-mmap-system.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@xe_pm@s=
2idle-vm-bind-userptr.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard=
-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm=
@s2idle-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-435/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel=
 XE#1694</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138220v1/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_pm@s=
3-basic.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe=
_pm@s3-basic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/569">Intel XE#569</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-bmg-1/igt@xe_pm@s=
3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@=
s4-basic.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm=
@s4-basic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-adlp-1/igt@xe_pm=
@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/=
igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sh=
ard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@=
s4-vm-bind-prefetch.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9=
/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/=
shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/ig=
t@xe_pm@s4-vm-bind-userptr.html">ABORT</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-6/igt@xe=
_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm=
_residency@idle-residency.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-436/igt@xe_pm_residency@idle-residency.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2710">Intel XE#2710</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sha=
rd-dg2-433/igt@xe_pm_residency@idle-residency.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sh=
ard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-138220v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
16">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel X=
E#1204</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138220v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0=
-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308=
b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sh=
ard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de=
6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bp=
p-rotate-0-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-=
adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_b=
ig_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sh=
ard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_b=
w@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays=
-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@km=
s_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_b=
w@linear-tiling-2-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-d=
isplays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_c=
cs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024=
de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen=
12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg=
2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_c=
cs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966=
68991c67ea/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_ccs@crc-=
sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_c=
cs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b=
71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-138220v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ge=
n12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_c=
hamelium_color@ctm-0-75.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
20v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_c=
hamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596=
668991c67ea/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-susp=
end.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_chameliu=
m_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_con=
tent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard=
-adlp-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13822=
0v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"=
>Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_c=
ursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-189=
0-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_cursor_leg=
acy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_d=
ither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596=
668991c67ea/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-=
a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_dither=
@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_f=
lip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308=
b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13822=
0v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile=
-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@drrs-suspend.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea=
/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/sha=
rd-dg2-432/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b7=
1024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/=
shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c=
72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_plane_scaling@planes-unit=
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
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c=
72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel=
 XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_p=
m_dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138220v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_p=
sr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3=
596668991c67ea/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-ar=
ea-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_=
psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_p=
sr@fbc-psr2-cursor-plane-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929=
">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_r=
otation_crc@primary-rotation-270.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea=
/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/327">Intel XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_r=
otation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966689=
91c67ea/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_rotation_crc@p=
rimary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_w=
riteback@writeback-fb-id-xrgb2101010.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c=
67ea/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@kms_writeback@writeback-fb=
-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_ev=
ict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966=
68991c67ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-463/igt@xe_evict@evict-be=
ng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_exec_fault_mode@ma=
ny-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#2=
88</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_ex=
ec_fault_mode@once-invalid-userptr-fault.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_exec_fault_mode=
@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_ex=
ec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupte=
d-dma-fence.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe=
_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_modu=
le_load@many-reload.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
20v1/shard-adlp-2/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026"=
>Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_oa=
@mi-rpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_oa@=
mi-rpc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-dg2-432/igt@xe_oa@m=
i-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_oa@=
oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/s=
hard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm_r=
esidency@toggle-gt-c6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-=
3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138220v1/shard-lnl-4/i=
gt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sha=
rd-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-138220v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8004 -&gt; IGT_8005</li>
<li>Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -&gt; xe-pw-138=
220v1</li>
</ul>
<p>IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f8=
0c3596668991c67ea<br />
  xe-pw-138220v1: 138220v1</p>

</body>
</html>

--===============8609773125034325925==--
