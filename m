Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAFACED632
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 09:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4853410E697;
	Wed,  9 Oct 2024 09:05:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7771D10E6A5;
 Wed,  9 Oct 2024 09:05:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7979988234889946856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_enable_lite_restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 09:05:10 -0000
Message-ID: <172846471048.1208392.4988942493547386841@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008233059.125021-1-fei.yang@intel.com>
In-Reply-To: <20241008233059.125021-1-fei.yang@intel.com>
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

--===============7979988234889946856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: enable lite restore
URL   : https://patchwork.freedesktop.org/series/139734/
State : failure

== Summary ==

CI Bug Log - changes from xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029_full -> xe-pw-139734v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139734v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139734v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139734v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +9 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_flip@absolute-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - {shard-bmg}:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-139734v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][5] ([Intel XE#1231])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#306]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#306])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1424])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#2577]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#309])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1475])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#599])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#886]) +5 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#651])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#656]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#656]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#653]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [PASS][23] -> [INCOMPLETE][24] ([Intel XE#2622]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format@pipe-a-plane-0:
    - shard-lnl:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#2929]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_plane@pixel-format@pipe-a-plane-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-8/igt@kms_plane@pixel-format@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#324]) +6 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#324]) +1 other test dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#361])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#2566])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#2763]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#2029])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#1620])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#2850] / [Intel XE#929])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-lnl:          [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2712]) +1 other test incomplete
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#2159]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#488])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html
    - shard-lnl:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2760]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_ccs@suspend-resume.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#2905])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#688]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#288])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2977]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#378])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#2284] / [Intel XE#366])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][57] -> [ABORT][58] ([Intel XE#1794])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [DMESG-WARN][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][61] ([Intel XE#877]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - {shard-bmg}:        [FAIL][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][65] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][67] ([Intel XE#877]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][71] ([Intel XE#301]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][73] ([Intel XE#886]) -> [PASS][74] +4 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][75] ([Intel XE#301]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][77] ([Intel XE#324]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][79] ([Intel XE#324]) -> [PASS][80] +3 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#361]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][83] ([Intel XE#1430]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][85] ([Intel XE#2948]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][87] ([Intel XE#899]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][89] ([Intel XE#1473]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [DMESG-WARN][91] -> [PASS][92] +2 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-lnl:          [INCOMPLETE][93] ([Intel XE#1169]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][95] ([Intel XE#1620]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][97] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][99] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][101] ([Intel XE#958]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [FAIL][103] ([Intel XE#958]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [TIMEOUT][105] ([Intel XE#402]) -> [FAIL][106] ([Intel XE#1231])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1231])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][109] ([Intel XE#324]) -> [DMESG-WARN][110] ([Intel XE#324])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          [TIMEOUT][111] ([Intel XE#1358]) -> [SKIP][112] ([Intel XE#2284] / [Intel XE#366])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712
  [Intel XE#2760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029 -> xe-pw-139734v1

  IGT_8061: 8061
  xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029: c8e01f4159a790812aa3c38cf659d6480fc7d029
  xe-pw-139734v1: 139734v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/index.html

--===============7979988234889946856==
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
<tr><td><b>Series:</b></td><td>drm/xe: enable lite restore</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139734/">https://patchwork.freedesktop.org/series/139734/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029_full -&gt; xe-pw-139734v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139734v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139734v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139734v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@absolute-wf_vblank:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139734v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_plane@pixel-format@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-8/igt@kms_plane@pixel-format@pipe-a-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712">Intel XE#2712</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760">Intel XE#2760</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977">Intel XE#2977</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-3/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139734v1/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029 -&gt; xe-pw-139734v1</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029: c8e01f4159a790812aa3c38cf659d6480fc7d029<br />
  xe-pw-139734v1: 139734v1</p>

</body>
</html>

--===============7979988234889946856==--
