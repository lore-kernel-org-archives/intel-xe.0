Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AEBE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3210EB23;
	Fri,  6 Sep 2024 23:56:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4710EB23;
 Fri,  6 Sep 2024 23:56:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8275845436037268042=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/display=3A_Merge_xe=27s_?=
 =?utf-8?q?display_info_probe_and_i915_HAS=5FDISPLAY_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 23:56:25 -0000
Message-ID: <172566698525.955479.10980308282185233510@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904173713.26891-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240904173713.26891-1-rodrigo.vivi@intel.com>
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

--===============8275845436037268042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Merge xe's display info probe and i915 HAS_DISPLAY checks
URL   : https://patchwork.freedesktop.org/series/138224/
State : failure

== Summary ==

CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_full -> xe-pw-138224v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138224v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138224v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138224v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     ([PASS][1], [PASS][2]) -> [DMESG-WARN][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cdclk@mode-transition:
    - {shard-bmg}:        ([FAIL][4], [FAIL][5]) ([Intel XE#2435]) -> [SKIP][6]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_cdclk@mode-transition.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        ([SKIP][7], [SKIP][8]) ([Intel XE#314]) -> [SKIP][9]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - {shard-bmg}:        ([FAIL][10], [FAIL][11]) ([Intel XE#2429]) -> [SKIP][12]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  
Known issues
------------

  Here are the changes found in xe-pw-138224v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         ([PASS][13], [PASS][14]) -> [DMESG-WARN][15] ([Intel XE#1033]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][16], [PASS][17]) -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          ([PASS][19], [PASS][20]) -> [FAIL][21] ([Intel XE#1659])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][22], [PASS][23]) -> [FAIL][24] ([Intel XE#1231])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     ([PASS][25], [PASS][26]) -> [DMESG-WARN][27] ([Intel XE#877])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          ([PASS][28], [PASS][29]) -> [FAIL][30] ([Intel XE#886]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     ([PASS][31], [PASS][32]) -> [INCOMPLETE][33] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     ([PASS][34], [PASS][35]) -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#2049])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         ([PASS][37], [PASS][38]) -> [FAIL][39] ([Intel XE#1874]) +10 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         ([PASS][40], [PASS][41]) -> [FAIL][42] ([Intel XE#1861])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#324]) +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          ([PASS][45], [PASS][46]) -> [DMESG-FAIL][47] ([Intel XE#324]) +1 other test dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          ([PASS][48], [PASS][49]) -> [DMESG-WARN][50] ([Intel XE#324])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     ([PASS][51], [PASS][52]) -> [FAIL][53] ([Intel XE#616]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1430])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          ([PASS][56], [PASS][57]) -> [FAIL][58] ([Intel XE#2443]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_vrr@max-min.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_vrr@max-min.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_vrr@max-min.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          ([PASS][59], [PASS][60]) -> [SKIP][61] ([Intel XE#1192])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     ([PASS][62], [PASS][63]) -> [FAIL][64] ([Intel XE#2136])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_module_load@reload.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1358] / [Intel XE#1616])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@xe_pm@s2idle-multiple-execs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195] / [Intel XE#1694])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          ([PASS][69], [PASS][70]) -> [ABORT][71] ([Intel XE#1358] / [Intel XE#1607])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_pm@s4-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_pm@s4-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([PASS][72], [DMESG-WARN][73]) ([Intel XE#1033]) -> [PASS][74] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          ([FAIL][75], [FAIL][76]) ([Intel XE#1701]) -> [PASS][77] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          ([FAIL][78], [PASS][79]) ([Intel XE#1426]) -> [PASS][80] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([FAIL][81], [PASS][82]) ([Intel XE#1426]) -> [PASS][83] +3 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         ([FAIL][84], [PASS][85]) ([Intel XE#1426]) -> [PASS][86] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][87] ([Intel XE#1659]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][89], [FAIL][90]) ([Intel XE#1231]) -> [PASS][91] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][92] ([Intel XE#1874]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][94] ([Intel XE#1204]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([DMESG-FAIL][96], [FAIL][97]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][98]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([FAIL][99], [FAIL][100]) ([Intel XE#1874]) -> [PASS][101] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [FAIL][102] ([Intel XE#2436]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][104] ([Intel XE#877]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        ([DMESG-WARN][106], [DMESG-WARN][107]) ([Intel XE#877]) -> [PASS][108]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          ([FAIL][109], [PASS][110]) ([Intel XE#2668]) -> [PASS][111]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          ([FAIL][112], [PASS][113]) ([Intel XE#886]) -> [PASS][114] +5 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         ([FAIL][115], [FAIL][116]) ([Intel XE#1861]) -> [PASS][117] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     ([DMESG-WARN][118], [DMESG-WARN][119]) ([Intel XE#2019]) -> [PASS][120]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        ([PASS][121], [SKIP][122]) ([Intel XE#1503]) -> [PASS][123]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - {shard-bmg}:        ([PASS][124], [DMESG-WARN][125]) ([Intel XE#877]) -> [PASS][126] +11 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][127] ([Intel XE#771] / [Intel XE#899]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          [FAIL][129] ([Intel XE#899]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        ([PASS][131], [FAIL][132]) ([Intel XE#899]) -> [PASS][133]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][134] ([Intel XE#899]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][136], [PASS][137]) ([Intel XE#1473] / [Intel XE#402]) -> [PASS][138]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        ([PASS][139], [TIMEOUT][140]) ([Intel XE#1473]) -> [PASS][141]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][142], [TIMEOUT][143]) ([Intel XE#1473]) -> [PASS][144] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][145] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         ([PASS][147], [DMESG-WARN][148]) ([Intel XE#2046]) -> [PASS][149]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][150] ([Intel XE#2105]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@mmio-triggered-reports:
    - {shard-bmg}:        ([FAIL][152], [FAIL][153]) ([Intel XE#2249]) -> [PASS][154]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          ([FAIL][155], [FAIL][156]) ([Intel XE#2249]) -> [PASS][157]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - {shard-bmg}:        [FAIL][158] ([Intel XE#2249]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html
    - shard-lnl:          [FAIL][160] ([Intel XE#2249]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          ([FAIL][162], [FAIL][163]) ([Intel XE#2514]) -> [PASS][164]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html
    - {shard-bmg}:        ([FAIL][165], [FAIL][166]) ([Intel XE#2514]) -> [PASS][167]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-lnl:          ([DMESG-FAIL][168], [PASS][169]) ([Intel XE#1620]) -> [PASS][170] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_pm@d3hot-mmap-system.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-bmg}:        ([INCOMPLETE][171], [PASS][172]) ([Intel XE#1616]) -> [PASS][173]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
    - shard-dg2-set2:     ([PASS][174], [INCOMPLETE][175]) ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][176]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic:
    - {shard-bmg}:        ([DMESG-WARN][177], [PASS][178]) ([Intel XE#569] / [Intel XE#877]) -> [PASS][179]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_pm@s3-basic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_pm@s3-basic.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-1/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         ([ABORT][180], [PASS][181]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][182]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-basic.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s4-basic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          ([ABORT][183], [PASS][184]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][185]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         ([PASS][186], [ABORT][187]) ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][188]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          ([PASS][189], [ABORT][190]) ([Intel XE#1794]) -> [PASS][191]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     ([FAIL][192], [FAIL][193]) ([Intel XE#2710]) -> [PASS][194] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm_residency@idle-residency.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm_residency@idle-residency.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-434/igt@xe_pm_residency@idle-residency.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][195], [SKIP][196]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][197] ([Intel XE#316])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         ([DMESG-FAIL][198], [FAIL][199]) ([Intel XE#1204] / [Intel XE#324]) -> [FAIL][200] ([Intel XE#1204])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         ([FAIL][201], [FAIL][202]) ([Intel XE#1231]) -> [DMESG-FAIL][203] ([Intel XE#324]) +1 other test dmesg-fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     ([SKIP][204], [SKIP][205]) ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][206] ([Intel XE#607])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][207], [DMESG-FAIL][208]) ([Intel XE#1231] / [Intel XE#324]) -> [FAIL][209] ([Intel XE#1231]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][211] ([Intel XE#610])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     ([SKIP][212], [SKIP][213]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1124]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     ([SKIP][215], [SKIP][216]) ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][217] ([Intel XE#346])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     ([SKIP][218], [SKIP][219]) ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][220] ([Intel XE#2191])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     ([SKIP][221], [SKIP][222]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][223] ([Intel XE#367])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][224], [SKIP][225]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#787]) +69 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     ([SKIP][227], [SKIP][228]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][229] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     ([SKIP][230], [SKIP][231]) ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][232] ([Intel XE#1252]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     ([SKIP][233], [SKIP][234]) ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][235] ([Intel XE#306])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][237] ([Intel XE#373])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     ([SKIP][238], [SKIP][239]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][240] ([Intel XE#373]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     ([SKIP][241], [SKIP][242]) ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][243] ([Intel XE#307])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-adlp:         [SKIP][244] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][245] ([Intel XE#1201])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_content_protection@mei-interface.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     ([SKIP][246], [SKIP][247]) ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][248] ([Intel XE#323])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     ([SKIP][249], [SKIP][250]) ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][251] ([Intel XE#703])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][253] ([Intel XE#651])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     ([SKIP][254], [SKIP][255]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][256] ([Intel XE#651]) +20 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][258] ([Intel XE#653])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     ([SKIP][259], [SKIP][260]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][261] ([Intel XE#653]) +20 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     ([SKIP][262], [SKIP][263]) ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][264] ([Intel XE#870])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     ([SKIP][265], [SKIP][266]) ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][267] ([Intel XE#1129])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     ([SKIP][268], [SKIP][269]) ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][270] ([Intel XE#1489]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     ([SKIP][271], [SKIP][272]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][273] ([Intel XE#929]) +11 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     ([SKIP][274], [SKIP][275]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][276] ([Intel XE#327]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     ([SKIP][277], [SKIP][278]) ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][279] ([Intel XE#1127])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     ([SKIP][280], [SKIP][281]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][282] ([Intel XE#455]) +11 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-center.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-center.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][284] ([Intel XE#455])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     ([SKIP][285], [SKIP][286]) ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][287] ([Intel XE#756])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     ([SKIP][288], [SKIP][289]) ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][290] ([Intel XE#1123])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     ([SKIP][291], [SKIP][292]) ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][293] ([Intel XE#1126])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     ([SKIP][294], [SKIP][295]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][296] ([Intel XE#288]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][298] ([Intel XE#288])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     ([SKIP][299], [SKIP][300]) ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][301] ([Intel XE#2360])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][302] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][303] ([Intel XE#1961] / [Intel XE#2026])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_module_load@many-reload.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     ([SKIP][304], [SKIP][305]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][306] ([Intel XE#2541]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     ([SKIP][307], [SKIP][308]) ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][309] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          ([ABORT][310], [PASS][311]) ([Intel XE#1358] / [Intel XE#1607]) -> [ABORT][312] ([Intel XE#1358] / [Intel XE#1607])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     ([SKIP][313], [SKIP][314]) ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][315] ([Intel XE#579])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][316], [FAIL][317]) ([Intel XE#958]) -> [FAIL][318] ([Intel XE#958])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     ([SKIP][319], [SKIP][320]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][321] ([Intel XE#944])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
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
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2668]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2668
  [Intel XE#2710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2710
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * IGT: IGT_8004 -> IGT_8005
  * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-pw-138224v1

  IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
  xe-pw-138224v1: 138224v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/index.html

--===============8275845436037268042==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Merge xe&#x27;s display info=
 probe and i915 HAS_DISPLAY checks</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/138224/">https://patchwork.freedesktop.org/series/138224/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138224v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138224v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c35966689=
91c67ea_full -&gt; xe-pw-138224v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138224v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-138224v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1382=
24v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_f=
lip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interrupt=
ible@ac-hdmi-a6-dp4.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-pa=
nning-interruptible@ac-hdmi-a6-dp4.html">DMESG-WARN</a></li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-7/igt@k=
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
24v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></=
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
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_c=
dclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138224v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308=
b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_a=
sync_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/103=
3">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_a=
tomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc=
0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_atomic_transition@pl=
ane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/=
igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_big=
_fb@4-tiled-64bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sha=
rd-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8=
/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b7=
1024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">PASS</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big_f=
b@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#=
1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_f=
lip@2x-flip-vs-panning-interruptible.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c=
67ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
24v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_fli=
p@blocking-wf_vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4=
/igt@kms_flip@blocking-wf_vblank.html">PASS</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-3/igt@kms_flip@bl=
ocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
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
el-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-433/igt@kms_flip@fl=
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-433/igt=
@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pip=
e-d-hdmi-a-1-y-to-y.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-1/igt@kms_flip_tiling@flip-ch=
ange-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +10 other t=
ests fail</li>
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
1.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_frontbuffer_trackin=
g@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_plan=
e@plane-position-covered.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_plane@plane-posi=
tion-covered.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
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
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_pla=
ne@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg=
-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_pla=
ne@plane-position-hole@pipe-b-plane-2.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PA=
SS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
8224v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_p=
lane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596=
668991c67ea/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size=
-64.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138224v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a=
-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-138224v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel X=
E#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_vrr=
@max-min.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_vrr=
@max-min.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-138224v1/shard-lnl-8/igt@kms_vrr@max-min.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#=
2443</a>) +1 other test fail</li>
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
fx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_live_ktest@xe_=
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
-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-463/igt@xe_module_load@re=
load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@xe_pm@s2=
idle-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-4/igt@xe_pm@s2idle-multiple-exe=
cs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-436/igt@xe_pm@s2idle-vm-b=
ind-unbind-all.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_pm@s=
4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_pm@s4=
-basic.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-138224v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#13=
58</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/160=
7">Intel XE#1607</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sh=
ard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_ato=
mic_transition@modeset-transition-nonblocking.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35=
96668991c67ea/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonb=
locking.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1701">Intel XE#1701</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-1/igt@kms_atomic_transition@=
modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
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
224v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">PASS</a> +1 other test pass</li>
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-=
dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-=
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
x-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-2/igt@kms_atomic_transi=
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/s=
hard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
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
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@kms_big=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/=
shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
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
w-138224v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0=
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
224v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
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
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-4/igt@kms_big_fb@=
y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#=
2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
138224v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pi=
pe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Inte=
l XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138224v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-cc=
s@pipe-c-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
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
/intel-xe/xe-pw-138224v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa=
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-5/igt@k=
ms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
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
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224=
v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +5 ot=
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
g/tree/intel-xe/xe-pw-138224v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fb=
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
el-xe/xe-pw-138224v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_hdr=
@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms=
_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-2/igt@kms_hdr@inval=
id-hdr.html">PASS</a></li>
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
/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_uni=
versal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adl=
p-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_univ=
ersal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-4/igt@kms_un=
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
ntel-xe/xe-pw-138224v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard=
-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</=
a></li>
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
-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-435/igt@xe_evict@evict-be=
ng-mixed-many-threads-small.html">PASS</a></li>
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
e-pw-138224v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html"=
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
el-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-sm=
all.html">PASS</a> +1 other test pass</li>
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sha=
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/s=
hard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_exec_=
reset@parallel-gt-reset.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-2/igt@xe_e=
xec_reset@parallel-gt-reset.html">PASS</a></li>
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
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@m=
mio-triggered-reports.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-=
4/igt@xe_oa@mmio-triggered-reports.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_oa@mm=
io-triggered-reports@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@xe_o=
a@mmio-triggered-reports@ccs-0.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mm=
io-triggered-reports@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/igt@xe_o=
a@mmio-triggered-reports@ccs-0.html">PASS</a></li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-6/igt@x=
e_oa@oa-regs-whitelisted.html">PASS</a></li>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@o=
a-regs-whitelisted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/i=
gt@xe_oa@oa-regs-whitelisted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-5/igt@x=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-1/ig=
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard=
-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm=
@s2idle-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-435/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel=
 XE#1694</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138224v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a><=
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
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-bmg-1/igt@xe_pm@s=
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
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-adlp-8/igt@xe_pm=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sh=
ard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/=
shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
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
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-7/igt@xe=
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sha=
rd-dg2-434/igt@xe_pm_residency@idle-residency.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_b=
ig_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316=
">Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/316">Intel XE#316</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sh=
ard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308=
b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-ad=
lp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_b=
ig_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_big_fb@y-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-=
adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/s=
hard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#=
610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_b=
ig_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024=
de6f80c3596668991c67ea/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-=
dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_b=
ig_joiner@invalid-modeset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE=
#346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
138224v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE=
#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_b=
w@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays=
-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@km=
s_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_b=
w@linear-tiling-1-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-d=
isplays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_c=
cs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de=
6f80c3596668991c67ea/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-m=
c-ccs@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-43=
2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_c=
cs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de=
6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-m=
tl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/=
shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67=
ea/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1252">Intel XE#1252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_c=
hamelium_color@ctm-max.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2=
-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224=
v1/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_ch=
amelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel X=
E#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-138224v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibern=
ate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_c=
hamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c6=
7ea/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-f=
or-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_c=
ontent_protection@dp-mst-type-0.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/=
shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/307">Intel XE#307</a>)</li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard=
-adlp-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_c=
ursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-bef=
ore-cursor-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/=
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel X=
E#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_f=
eature_discovery@display-3x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Inte=
l XE#703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138224v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">In=
tel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc030=
8b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138=
224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c6=
7ea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc=
psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_p=
m_backlight@fade-with-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard=
-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel =
XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138224v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel=
 XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_p=
m_dc@dc5-psr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@k=
ms_pm_dc@dc5-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/=
igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_p=
sr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6=
f80c3596668991c67ea/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-co=
ntinuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432=
/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_p=
sr@fbc-psr2-primary-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard=
-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138224v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_r=
otation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_rotation_crc@p=
rimary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_r=
otation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_rotation_crc=
@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_s=
caling_modes@scaling-mode-center.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea=
/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_v=
rr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_w=
riteback@writeback-pixel-formats.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea=
/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138224v1/shard-dg2-432/igt@kms_writeback@writeback-pixel-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_co=
py_basic@mem-copy-linear-0x369.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#11=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_co=
py_basic@mem-set-linear-0xfffe.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#11=
26</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_ex=
ec_fault_mode@many-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard=
-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel =
XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-138224v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel=
 XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/sh=
ard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#28=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_ex=
ec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668=
991c67ea/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_exec_mix_mode=
s@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
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
24v1/shard-adlp-2/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026"=
>Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_oa=
@non-privileged-map-oa-buffer.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sh=
ard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138224v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm=
@d3cold-multiple-execs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2=
-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-138224v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s=
4-exec-after.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@xe=
_pm@s4-exec-after.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-2/ig=
t@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm=
@vram-d3cold-threshold.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2=
-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224=
v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)=
</li>
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
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138224v1/shard-lnl-8/i=
gt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_qu=
ery@multigpu-query-topology.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138224v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>)</li>
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
224v1</li>
</ul>
<p>IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f8=
0c3596668991c67ea<br />
  xe-pw-138224v1: 138224v1</p>

</body>
</html>

--===============8275845436037268042==--
