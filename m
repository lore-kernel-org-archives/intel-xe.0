Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C0ACA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 16:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1610E166;
	Fri, 22 Aug 2025 16:16:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ED910E166;
 Fri, 22 Aug 2025 16:16:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6644982318551487284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Fixes_from_the_e?=
 =?utf-8?q?xhaustive_eviction_series?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 16:16:22 -0000
Message-ID: <175587938219.261609.13554492038564863346@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
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

--===============6644982318551487284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fixes from the exhaustive eviction series
URL   : https://patchwork.freedesktop.org/series/153298/
State : success

== Summary ==

CI Bug Log - changes from xe-3592-4627b9e096977d9c360d172897b7577dc339751f_FULL -> xe-pw-153298v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153298v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#4543]) +2 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@kms_async_flips@crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@kms_async_flips@crc.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#367])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +111 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#4417]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] ([Intel XE#1178]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2320]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2321])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2291]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#1475])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#5299])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#3009])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-5/igt@kms_dp_aux_dev.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2316]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#4543]) +3 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2293] / [Intel XE#2380])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2293])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#5390]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2313]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1503]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_hdr@static-swap.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2927])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#4596])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2391])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2387] / [Intel XE#5899])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1435])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1499])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4837]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#1392]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2322])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4943]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][51] ([Intel XE#3876]) +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1173])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2427])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#4819]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-436/igt@xe_pmu@gt-frequency.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#5166]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-8/igt@xe_pmu@gt-frequency.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4733])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#944])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][60] ([Intel XE#911]) -> [PASS][61] +3 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][62] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [FAIL][64] ([Intel XE#5376]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][66] ([Intel XE#2291]) -> [PASS][67] +2 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][68] ([Intel XE#5338]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][70] ([Intel XE#2316]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][72] ([Intel XE#4543]) -> [PASS][73] +5 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][74] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][76] ([Intel XE#301]) -> [PASS][77] +3 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][78] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][80] ([Intel XE#1874]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#455]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-adlp:         [DMESG-WARN][84] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][86] ([Intel XE#1499]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1392]) -> [PASS][89] +4 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck:
    - shard-bmg:          [INCOMPLETE][90] ([Intel XE#2594]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][92] ([Intel XE#4543] / [Intel XE#4921]) -> [DMESG-FAIL][93] ([Intel XE#4543])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][94] ([Intel XE#1178]) -> [SKIP][95] ([Intel XE#2341])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-5/igt@kms_content_protection@legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][96] ([Intel XE#2311]) -> [SKIP][97] ([Intel XE#2312]) +11 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][98] ([Intel XE#2312]) -> [SKIP][99] ([Intel XE#2311]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][100] ([Intel XE#5390]) -> [SKIP][101] ([Intel XE#2312]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][102] ([Intel XE#2312]) -> [SKIP][103] ([Intel XE#5390]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][104] ([Intel XE#2312]) -> [SKIP][105] ([Intel XE#2313]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][106] ([Intel XE#2313]) -> [SKIP][107] ([Intel XE#2312]) +9 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [SKIP][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [SKIP][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [DMESG-WARN][156], [PASS][157], [PASS][158], [PASS][159]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173] / [Intel XE#5612])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-8/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-9/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1061]) -> [FAIL][161] ([Intel XE#1173])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-432/igt@xe_peer2peer@read.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][162] ([Intel XE#1173]) -> [SKIP][163] ([Intel XE#1061])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-436/igt@xe_peer2peer@write.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@xe_peer2peer@write.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3592-4627b9e096977d9c360d172897b7577dc339751f -> xe-pw-153298v1

  IGT_8503: 8503
  xe-3592-4627b9e096977d9c360d172897b7577dc339751f: 4627b9e096977d9c360d172897b7577dc339751f
  xe-pw-153298v1: 153298v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/index.html

--===============6644982318551487284==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fixes from the exhaustive eviction s=
eries</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153298/">https://patchwork.freedesktop.org/series/153298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153298v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153298v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3592-4627b9e096977d9c360d172897b7577dc=
339751f_FULL -&gt; xe-pw-153298v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153298v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@kms_asy=
nc_flips@crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@kms_async_flips@crc.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-4/igt@kms_fli=
p@dpms-off-confusion-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/i=
gt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp=
-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-3/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v=
1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexec=
queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_system_allocator@many=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-=
shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +1 other te=
st dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-436/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153298v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"=
>Intel XE#4819</a>) +1 other test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-8/igt@xe_pmu@g=
t-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153298v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166">Int=
el XE#5166</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153298v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153298v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a=
-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-8/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-3/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-5/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@kms_fli=
p@flip-vs-dpms-on-nop@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adl=
p-2/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v=
1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-466/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@kms_pm_=
rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/=
shard-adlp-1/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-7/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-433=
/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@xe_exec_=
system_allocator@many-execqueues-mmap-remap-ro-eocheck.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Inte=
l XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153298v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap=
-remap-ro-eocheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153298v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153298v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153298v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751=
f/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc3=
39751f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b75=
77dc339751f/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d1728=
97b7577dc339751f/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360=
d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d=
9c360d172897b7577dc339751f/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e09=
6977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627=
b9e096977d9c360d172897b7577dc339751f/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592=
-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-ad=
lp-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc339751=
f/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b7577dc3=
39751f/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d172897b75=
77dc339751f/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360d1728=
97b7577dc339751f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d9c360=
d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3592-4627b9e096977d=
9c360d172897b7577dc339751f/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v=
1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153298v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3298v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153298v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard=
-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_load@load.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/=
shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153298v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1532=
98v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-a=
dlp-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153298v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612"=
>Intel XE#5612</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-466/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3592-4627b9e096977d9c360d172897b7577dc339751f/shard-dg2-436/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153298v1/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3592-4627b9e096977d9c360d172897b7577dc339751f -&gt; xe-pw-153=
298v1</li>
</ul>
<p>IGT_8503: 8503<br />
  xe-3592-4627b9e096977d9c360d172897b7577dc339751f: 4627b9e096977d9c360d172=
897b7577dc339751f<br />
  xe-pw-153298v1: 153298v1</p>

</body>
</html>

--===============6644982318551487284==--
