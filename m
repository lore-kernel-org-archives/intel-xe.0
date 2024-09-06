Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E428FE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C10D10EB11;
	Fri,  6 Sep 2024 22:09:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940B010EB11;
 Fri,  6 Sep 2024 22:09:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8960322654947449151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_Fix_extobj_dma-resv_slot_usage_?=
 =?utf-8?q?in_XE=27s_exec_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 22:09:58 -0000
Message-ID: <172566059859.955479.14757037679573318510@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904170500.3303081-1-matthew.brost@intel.com>
In-Reply-To: <20240904170500.3303081-1-matthew.brost@intel.com>
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

--===============8960322654947449151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix extobj dma-resv slot usage in XE's exec IOCTL
URL   : https://patchwork.freedesktop.org/series/138221/
State : success

== Summary ==

CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_full -> xe-pw-138221v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138221v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cdclk@mode-transition:
    - {shard-bmg}:        ([FAIL][1], [FAIL][2]) ([Intel XE#2435]) -> [SKIP][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_cdclk@mode-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        ([SKIP][4], [SKIP][5]) ([Intel XE#314]) -> [SKIP][6]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - {shard-bmg}:        ([FAIL][7], [FAIL][8]) ([Intel XE#2429]) -> [SKIP][9]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - {shard-bmg}:        ([DMESG-WARN][10], [PASS][11]) ([Intel XE#877]) -> [INCOMPLETE][12]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-138221v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          ([PASS][13], [PASS][14]) -> [FAIL][15] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][16], [PASS][17]) -> [FAIL][18] ([Intel XE#1231])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          ([PASS][19], [PASS][20]) -> [FAIL][21] ([Intel XE#886]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         ([PASS][22], [PASS][23]) -> [FAIL][24] ([Intel XE#1874]) +8 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         ([PASS][25], [PASS][26]) -> [FAIL][27] ([Intel XE#1861])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#324]) +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#324])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     ([PASS][32], [PASS][33]) -> [FAIL][34] ([Intel XE#616]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#718])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#1430])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#899])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          ([PASS][41], [PASS][42]) -> [FAIL][43] ([Intel XE#2443]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_vrr@max-min.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_vrr@max-min.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_vrr@max-min.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          ([PASS][44], [PASS][45]) -> [SKIP][46] ([Intel XE#1192])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     ([PASS][47], [PASS][48]) -> [FAIL][49] ([Intel XE#2136])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_module_load@reload.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_module_load@reload.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#1694])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][52] -> [ABORT][53] ([Intel XE#1358] / [Intel XE#1607])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         ([PASS][54], [PASS][55]) -> [ABORT][56] ([Intel XE#1794])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@s4-mocs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@xe_pm@s4-mocs.html
    - shard-lnl:          ([PASS][57], [PASS][58]) -> [ABORT][59] ([Intel XE#1794])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          ([PASS][60], [PASS][61]) -> [ABORT][62] ([Intel XE#1607] / [Intel XE#1794])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([PASS][63], [DMESG-WARN][64]) ([Intel XE#1033]) -> [PASS][65]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([FAIL][66], [PASS][67]) ([Intel XE#1426]) -> [PASS][68] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         ([FAIL][69], [PASS][70]) ([Intel XE#1426]) -> [PASS][71] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][72], [FAIL][73]) ([Intel XE#1231]) -> [PASS][74] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][75] ([Intel XE#1874]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][77] ([Intel XE#1204]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([DMESG-FAIL][79], [FAIL][80]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][81]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([FAIL][82], [FAIL][83]) ([Intel XE#1874]) -> [PASS][84] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][85] ([Intel XE#2436]) -> [PASS][86] +3 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          ([FAIL][87], [PASS][88]) ([Intel XE#2668]) -> [PASS][89]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          ([PASS][90], [FAIL][91]) ([Intel XE#886]) -> [PASS][92] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         ([FAIL][93], [FAIL][94]) ([Intel XE#1861]) -> [PASS][95] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     ([DMESG-WARN][96], [DMESG-WARN][97]) ([Intel XE#2019]) -> [PASS][98]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        ([PASS][99], [SKIP][100]) ([Intel XE#1503]) -> [PASS][101]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - {shard-bmg}:        ([PASS][102], [DMESG-WARN][103]) ([Intel XE#877]) -> [PASS][104] +11 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][105] ([Intel XE#1430]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][107] ([Intel XE#899]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        ([PASS][109], [FAIL][110]) ([Intel XE#899]) -> [PASS][111] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][112] ([Intel XE#899]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][114], [TIMEOUT][115]) ([Intel XE#1473]) -> [PASS][116]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][117] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         ([PASS][119], [DMESG-WARN][120]) ([Intel XE#2046]) -> [PASS][121]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_oa@mmio-triggered-reports:
    - {shard-bmg}:        ([FAIL][122], [FAIL][123]) ([Intel XE#2249]) -> [PASS][124]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          ([FAIL][125], [FAIL][126]) ([Intel XE#2249]) -> [PASS][127]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - {shard-bmg}:        [FAIL][128] ([Intel XE#2249]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@rcs-0.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html
    - shard-lnl:          [FAIL][130] ([Intel XE#2249]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@rcs-0.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@non-zero-reason@rcs-0:
    - {shard-bmg}:        [DMESG-WARN][132] ([Intel XE#877]) -> [PASS][133] +2 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@non-zero-reason@rcs-0.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-7/igt@xe_oa@non-zero-reason@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          ([FAIL][134], [FAIL][135]) ([Intel XE#2514]) -> [PASS][136] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html
    - {shard-bmg}:        ([FAIL][137], [FAIL][138]) ([Intel XE#2514]) -> [PASS][139]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-bmg}:        ([INCOMPLETE][140], [PASS][141]) ([Intel XE#1616]) -> [PASS][142]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.html
    - shard-dg2-set2:     ([PASS][143], [INCOMPLETE][144]) ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][145]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic:
    - {shard-bmg}:        ([DMESG-WARN][146], [PASS][147]) ([Intel XE#569] / [Intel XE#877]) -> [PASS][148]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_pm@s3-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_pm@s3-basic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-1/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         ([ABORT][149], [PASS][150]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][151]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s4-basic.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          ([ABORT][152], [PASS][153]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][154] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         ([PASS][155], [ABORT][156]) ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][157]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          ([PASS][158], [ABORT][159]) ([Intel XE#1794]) -> [PASS][160]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     ([FAIL][161], [FAIL][162]) ([Intel XE#2710]) -> [PASS][163] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pm_residency@idle-residency.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm_residency@idle-residency.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-466/igt@xe_pm_residency@idle-residency.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         ([DMESG-WARN][164], [PASS][165]) ([Intel XE#1033]) -> [DMESG-WARN][166] ([Intel XE#1033])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          ([FAIL][167], [PASS][168]) ([Intel XE#1426]) -> [FAIL][169] ([Intel XE#1426]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][170], [FAIL][171]) ([Intel XE#1426]) -> [FAIL][172] ([Intel XE#1426]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][173], [SKIP][174]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][175] ([Intel XE#316]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         ([DMESG-FAIL][176], [FAIL][177]) ([Intel XE#1204] / [Intel XE#324]) -> [FAIL][178] ([Intel XE#1204])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         ([FAIL][179], [DMESG-FAIL][180]) ([Intel XE#1231] / [Intel XE#324]) -> [FAIL][181] ([Intel XE#1231]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     ([SKIP][182], [SKIP][183]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][184] ([Intel XE#1124]) +11 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1124])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     ([SKIP][187], [SKIP][188]) ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][189] ([Intel XE#2191])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     ([SKIP][190], [SKIP][191]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][192] ([Intel XE#367]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][193], [SKIP][194]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][195] ([Intel XE#787]) +76 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     ([SKIP][196], [SKIP][197]) ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][198] ([Intel XE#1252])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     ([SKIP][199], [SKIP][200]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][201] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     ([SKIP][202], [SKIP][203]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][204] ([Intel XE#373]) +9 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     ([SKIP][205], [SKIP][206]) ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][207] ([Intel XE#307])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][209] ([Intel XE#1201])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_content_protection@mei-interface.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     ([SKIP][210], [SKIP][211]) ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][212] ([Intel XE#308]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     ([SKIP][213], [SKIP][214]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][215] ([Intel XE#455]) +16 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     ([SKIP][216], [SKIP][217]) ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][218] ([Intel XE#776]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     ([SKIP][219], [SKIP][220]) ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][221] ([Intel XE#1138])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     ([SKIP][222], [SKIP][223]) ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][224] ([Intel XE#1137])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          ([FAIL][225], [PASS][226]) ([Intel XE#886]) -> [FAIL][227] ([Intel XE#886]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     ([SKIP][228], [SKIP][229]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][230] ([Intel XE#651]) +29 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     ([SKIP][231], [SKIP][232]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][233] ([Intel XE#653]) +26 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][235] ([Intel XE#653])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     ([SKIP][236], [SKIP][237]) ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][238] ([Intel XE#2318] / [Intel XE#455]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][239], [SKIP][240]) ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][241] ([Intel XE#2318]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     ([SKIP][242], [SKIP][243]) ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][244] ([Intel XE#908])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][246] ([Intel XE#908])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     ([SKIP][247], [SKIP][248]) ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][249] ([Intel XE#1489]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     ([SKIP][250], [SKIP][251]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][252] ([Intel XE#929]) +13 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][254] ([Intel XE#929])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_psr@psr2-primary-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     ([SKIP][255], [SKIP][256]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][257] ([Intel XE#327]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     ([SKIP][258], [SKIP][259]) ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][260] ([Intel XE#330])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     ([SKIP][261], [SKIP][262]) ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][263] ([Intel XE#1091]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     ([SKIP][264], [SKIP][265]) ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1123])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     ([SKIP][267], [SKIP][268]) ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][269] ([Intel XE#1126]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     ([TIMEOUT][270], [PASS][271]) ([Intel XE#1473] / [Intel XE#402]) -> [TIMEOUT][272] ([Intel XE#1473] / [Intel XE#402])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][274] ([Intel XE#288])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@once-rebind:
    - shard-dg2-set2:     ([SKIP][275], [SKIP][276]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][277] ([Intel XE#288]) +22 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     ([SKIP][278], [SKIP][279]) ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][280] ([Intel XE#2229])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     ([SKIP][281], [SKIP][282]) ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][283] ([Intel XE#560])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][284] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][285] ([Intel XE#1961] / [Intel XE#2026])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_module_load@many-reload.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     ([SKIP][286], [SKIP][287]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][288] ([Intel XE#2541]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     ([SKIP][289], [SKIP][290]) ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][291] ([Intel XE#977])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_pat@pat-index-xe2.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     ([SKIP][292], [SKIP][293]) ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][294] ([Intel XE#979])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     ([SKIP][295], [SKIP][296]) ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][297] ([Intel XE#2284])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][298], [FAIL][299]) ([Intel XE#958]) -> [FAIL][300] ([Intel XE#958])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     ([SKIP][301], [SKIP][302]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][303] ([Intel XE#944])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_query@multigpu-query-config.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_query@multigpu-query-config.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][305] ([Intel XE#944])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
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
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2668]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2668
  [Intel XE#2710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2710
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8004 -> IGT_8005
  * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-pw-138221v1

  IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
  xe-pw-138221v1: 138221v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/index.html

--===============8960322654947449151==
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
<tr><td><b>Series:</b></td><td>Fix extobj dma-resv slot usage in XE&#x27;s =
exec IOCTL</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/138221/">https://patchwork.freedesktop.org/series/138221/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138221v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138221v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c35966689=
91c67ea_full -&gt; xe-pw-138221v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1382=
21v1_full:</p>
<h3>IGT changes</h3>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-4/igt@k=
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
21v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></=
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
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-1/igt@kms_c=
dclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@kms_fli=
p@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de=
6f80c3596668991c67ea/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms=
-off-vs-modeset.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-3/igt@kms_flip@2x-sing=
le-buffer-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138221v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b=
71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_atomic_transition@plane-tog=
gle-modeset-transition@pipe-a-edp-1.html">PASS</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-7/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel =
XE#1426</a>) +1 other test fail</li>
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
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@kms_big_f=
b@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#=
1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_fli=
p@wf_vblank-ts-check@a-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/i=
gt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other t=
est fail</li>
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
1.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-4/igt@kms_flip_tiling@flip-ch=
ange-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +8 other te=
sts fail</li>
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
1.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_frontbuffer_trackin=
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
ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_plane@plane-posi=
tion-covered.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_plan=
e@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_p=
lane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)=
</li>
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
-xe/xe-pw-138221v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a=
-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-138221v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel X=
E#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@=
kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
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
intel-xe/xe-pw-138221v1/shard-lnl-2/igt@kms_vrr@max-min.html">FAIL</a> (<a =
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
fx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_live_ktest@xe_=
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
-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_module_load@re=
load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-463/igt@xe_pm@s2idle-vm-b=
ind-unbind-all.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-138221v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-2/igt@xe_pm@=
s4-mocs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@xe_pm@s=
4-mocs.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-138221v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#17=
94</a>)</li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_pm@s=
4-mocs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_pm@s4-=
mocs.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/i=
gt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_pm@s4-vm-bin=
d-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sh=
ard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-a-1-y.html">PASS</a></li>
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-=
dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-=
a-6.html">PASS</a> +1 other test pass</li>
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
x-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-8/igt@kms_atomic_transi=
tion@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
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
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-1/igt@kms_big=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/=
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
w-138221v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0=
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
221v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
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
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-4/igt@kms_big_fb@=
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
21v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c=
-dp-2.html">PASS</a> +3 other tests pass</li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@k=
ms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@kms_fli=
p@wf_vblank-ts-check@b-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/s=
hard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +3 other t=
ests pass</li>
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
g/tree/intel-xe/xe-pw-138221v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
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
el-xe/xe-pw-138221v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend=
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
el-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-2/igt@kms_hdr@inval=
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
/intel-xe/xe-pw-138221v1/shard-bmg-7/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@kms_univ=
ersal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-5/igt@kms_un=
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
ntel-xe/xe-pw-138221v1/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@p=
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard=
-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</=
a></li>
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
el-xe/xe-pw-138221v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-sm=
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sha=
rd-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/s=
hard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
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
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@m=
mio-triggered-reports.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-=
4/igt@xe_oa@mmio-triggered-reports.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2=
/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mm=
io-triggered-reports@rcs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8/igt@xe_o=
a@mmio-triggered-reports@rcs-0.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-7/igt@xe_oa@mm=
io-triggered-reports@rcs-0.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-2/igt@xe_o=
a@mmio-triggered-reports@rcs-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@no=
n-zero-reason@rcs-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-7/igt@xe_oa@n=
on-zero-reason@rcs-0.html">PASS</a> +2 other tests pass</li>
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-1/igt@x=
e_oa@oa-regs-whitelisted.html">PASS</a> +1 other test pass</li>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@xe_oa@o=
a-regs-whitelisted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/i=
gt@xe_oa@oa-regs-whitelisted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-8/igt@x=
e_oa@oa-regs-whitelisted.html">PASS</a></li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard=
-bmg-2/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm=
@s2idle-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-435/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel=
 XE#1694</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-138221v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a><=
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
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-bmg-1/igt@xe_pm@s=
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
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-adlp-1/igt@xe_pm=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sh=
ard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> +1 other test pass</=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/=
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
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-6/igt@xe=
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sha=
rd-dg2-466/igt@xe_pm_residency@idle-residency.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3f=
fc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-f=
lip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sh=
ard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi=
-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1033">Intel XE#1033</a>)</li>
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
221v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_a=
tomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72=
d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_atomic_transiti=
on@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE=
#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-138221v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sh=
ard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-138221v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
16">Intel XE#316</a>) +3 other tests skip</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sh=
ard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-=
adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_b=
ig_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/=
shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#=
1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sha=
rd-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_b=
w@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c=
3596668991c67ea/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays=
-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@km=
s_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_b=
w@linear-tiling-2-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-d=
isplays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_c=
cs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0=
308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_ccs@crc-sprite-planes=
-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-138221v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-m=
c-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67=
ea/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1252">Intel XE#1252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_c=
cs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991=
c67ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_ccs@rand=
om-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_c=
hamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35966=
68991c67ea/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-format=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_chamelium_=
frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_c=
ontent_protection@dp-mst-lic-type-1.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c6=
7ea/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard=
-adlp-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_c=
ursor_crc@cursor-onscreen-512x512.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67e=
a/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_d=
sc@dsc-with-bpc-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-436/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1382=
21v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_f=
bcon_fbt@psr-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-4=
66/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/s=
hard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_f=
eature_discovery@display-4x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shar=
d-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-138221v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"=
>Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_f=
eature_discovery@dp-mst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg=
2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
8221v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#11=
37</a>)</li>
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
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221=
v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b710=
24de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shar=
d-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c6=
7ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653=
">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_p=
lane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b7102=
4de6f80c3596668991c67ea/shard-dg2-434/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-unity-scaling.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
38221v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-un=
ity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_p=
lane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a=
-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_plane_s=
caling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_plane_scaling=
@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"=
>Intel XE#2318</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_p=
m_dc@dc6-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@=
kms_pm_dc@dc6-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/=
igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms=
_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_p=
sr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c359666=
8991c67ea/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@kms_psr2_sf@ov=
erlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_p=
sr@fbc-psr2-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/i=
gt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2=
-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_ps=
r@psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432=
/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_r=
otation_crc@bad-pixel-format.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sha=
rd-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">=
Intel XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-138221v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
7">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_t=
v_load_detect@load-detect.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE=
#330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
138221v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE=
#330</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@sriov=
_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c35=
96668991c67ea/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-num=
vfs-all.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_co=
py_basic@mem-copy-linear-0xfffe.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/=
shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#=
1123</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xff=
fe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_co=
py_basic@mem-set-linear-0x3fff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/s=
hard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#11=
26</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1126">Intel XE#1126</a>) +1 other test skip</li>
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
-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-433/igt@xe_evict@evict-be=
ng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_exe=
c_fault_mode@many-execqueues-basic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/=
shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel X=
E#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_ex=
ec_fault_mode@once-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-432/igt@xe_exec_fault_mode@once-rebind.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE=
#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
138221v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE=
#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_li=
ve_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c359666=
8991c67ea/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_live_ktest@=
xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_me=
dia_fill@media-fill.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-43=
6/igt@xe_media_fill@media-fill.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/sha=
rd-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
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
21v1/shard-adlp-8/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026"=
>Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_oa=
@non-privileged-access-vaddr.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/sha=
rd-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-138221v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_pa=
t@pat-index-xe2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/ig=
t@xe_pat@pat-index-xe2.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-4=
32/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_pa=
t@pat-index-xelpg.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/=
igt@xe_pat@pat-index-xelpg.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-d=
g2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_pm=
@d3cold-mocs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@x=
e_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-dg2-432/=
igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
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
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221v1/shard-lnl-4/i=
gt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-=
dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
138221v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138221=
v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>)</li>
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
221v1</li>
</ul>
<p>IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f8=
0c3596668991c67ea<br />
  xe-pw-138221v1: 138221v1</p>

</body>
</html>

--===============8960322654947449151==--
