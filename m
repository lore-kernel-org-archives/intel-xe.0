Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CA5C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 07:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116CA10E8A9;
	Thu,  1 Aug 2024 07:50:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E110E8A9;
 Thu,  1 Aug 2024 07:50:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1494836971249865756=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_remove_GuC_reload_in_?=
 =?utf-8?q?D3Hot_path_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 07:50:07 -0000
Message-ID: <172249860749.486642.1685988508678983586@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801055941.1187878-1-riana.tauro@intel.com>
In-Reply-To: <20240801055941.1187878-1-riana.tauro@intel.com>
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

--===============1494836971249865756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: remove GuC reload in D3Hot path (rev5)
URL   : https://patchwork.freedesktop.org/series/135265/
State : failure

== Summary ==

CI Bug Log - changes from xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb_full -> xe-pw-135265v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135265v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135265v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135265v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-lnl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_gt_freq@freq_range_idle:
    - shard-lnl:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][9] -> [TIMEOUT][10] +1 other test timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1201]) -> [SKIP][12] +28 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  
Known issues
------------

  Here are the changes found in xe-pw-135265v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#323])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#877]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-6/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1135] / [Intel XE#1201])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195]) +4 other tests incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1874]) +6 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#1861]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1638])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#2028]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-1:
    - shard-lnl:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#324])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#324]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1874])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1129] / [Intel XE#1201])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#1430])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#836])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1149] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#327])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#899]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][56] -> [FAIL][57] ([Intel XE#899])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][60] -> [TIMEOUT][61] ([Intel XE#1473] / [Intel XE#402])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1473] / [Intel XE#392])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#2360])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#358])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@xe_exec_reset@cat-error.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#2419])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1061] / [Intel XE#1201])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [PASS][72] -> [TIMEOUT][73] ([Intel XE#1358])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_pm@s2idle-basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#1924] / [Intel XE#2028])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [PASS][76] -> [INCOMPLETE][77] ([Intel XE#1195] / [Intel XE#1358])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_pm@s4-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][78] -> [ABORT][79] ([Intel XE#1794]) +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][80] ([Intel XE#324]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][82] ([Intel XE#616]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][84] ([Intel XE#1874]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          [FAIL][88] ([Intel XE#2028]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#771] / [Intel XE#899]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][92] ([Intel XE#899]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][94] ([Intel XE#899]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][96] ([Intel XE#1600]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          [FAIL][98] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-5/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][100] ([Intel XE#1794]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][103] ([Intel XE#316])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#316]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][107] ([Intel XE#610])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1124]) -> [SKIP][109] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][111] ([Intel XE#1124]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#607]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#607])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][115] ([Intel XE#2191])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#2191]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#2191])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][119] ([Intel XE#367]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#787]) +48 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][129] ([Intel XE#1152]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][131] ([Intel XE#306])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#306]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#306])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#373]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][137] ([Intel XE#373]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#307]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#307])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [i915#2575]) -> [SKIP][141] ([i915#2575]) +10 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][143] ([Intel XE#308])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#2019]) -> [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#2019]) +1 other test incomplete
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][146] ([Intel XE#2019]) -> [DMESG-FAIL][147] ([Intel XE#2019]) +1 other test dmesg-fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][149] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_flip@2x-plain-flip-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#1551]) -> [INCOMPLETE][151] ([Intel XE#1551] / [Intel XE#2049])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#1551]) -> [DMESG-FAIL][153] ([Intel XE#1551])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][155] ([Intel XE#455]) +11 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][157] ([Intel XE#651]) +16 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#651]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][161] ([Intel XE#2351]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#653]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][165] ([Intel XE#653]) +14 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#417]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#417])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][168] ([Intel XE#1162]) -> [INCOMPLETE][169] ([Intel XE#1195])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][170] ([Intel XE#2019]) -> [FAIL][171] ([Intel XE#2028])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#455]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#498]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#870]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#870])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1489]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#1489])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][183] ([Intel XE#1489]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1122])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#929]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][189] ([Intel XE#929]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][191] ([Intel XE#327])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#1729]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#362])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#330]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#330])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][196] ([Intel XE#1551]) -> [INCOMPLETE][197] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#1551]) +1 other test incomplete
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][198] ([Intel XE#2019]) -> [INCOMPLETE][199] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#2019]) +1 other test incomplete
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2168]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#2168])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_vrr@cmrr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][203] ([Intel XE#756])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][205] ([Intel XE#1123])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1126]) -> [SKIP][207] ([Intel XE#1126] / [Intel XE#1201])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][208] ([Intel XE#1473] / [Intel XE#392]) -> [FAIL][209] ([Intel XE#1000])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#288]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][213] ([Intel XE#1130]) +40 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@xe_exec_fault_mode@once-basic-imm.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][215] ([Intel XE#288]) +16 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][217] ([Intel XE#2360])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#255]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#255])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][221] ([Intel XE#2229])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][223] ([Intel XE#512])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_mmap@small-bar.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@enable-disable:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2419]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#2419]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_oa@enable-disable.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_oa@enable-disable.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][227] ([Intel XE#2419]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_oa@invalid-oa-format-id.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][229] ([Intel XE#2284] / [Intel XE#366])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][230] ([Intel XE#1162] / [Intel XE#1941]) -> [DMESG-FAIL][231] ([Intel XE#1162])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][232] ([Intel XE#1551] / [Intel XE#569]) -> [DMESG-FAIL][233] ([Intel XE#1551]) +1 other test dmesg-fail
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][235] ([Intel XE#944])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_query@multigpu-query-config.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#944]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#944])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb -> xe-pw-135265v5

  IGT_7950: 7950
  xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb: 171eab5202f1033b5f509bae5214c8d7853336eb
  xe-pw-135265v5: 135265v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/index.html

--===============1494836971249865756==
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
<tr><td><b>Series:</b></td><td>drm/xe: remove GuC reload in D3Hot path (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135265/">https://patchwork.freedesktop.org/series/135265/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb_full -&gt; xe-pw-135265v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135265v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135265v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135265v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend@b-hdmi-a6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr-sprite-plane-onoff:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135265v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-6/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@xe_exec_reset@cat-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-8/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@xe_pm@s2idle-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_pm@s4-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-lnl-5/igt@xe_pm@s2idle-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_oa@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-466/igt@xe_oa@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-433/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-435/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v5/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb -&gt; xe-pw-135265v5</li>
</ul>
<p>IGT_7950: 7950<br />
  xe-1700-171eab5202f1033b5f509bae5214c8d7853336eb: 171eab5202f1033b5f509bae5214c8d7853336eb<br />
  xe-pw-135265v5: 135265v5</p>

</body>
</html>

--===============1494836971249865756==--
