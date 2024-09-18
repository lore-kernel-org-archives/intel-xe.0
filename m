Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6046CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 10:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A110E195;
	Wed, 18 Sep 2024 10:20:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED210E17F;
 Wed, 18 Sep 2024 10:20:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7937727070132640844=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Convert_to_USM_lock_t?=
 =?utf-8?q?o_rwsem?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 10:20:23 -0000
Message-ID: <172665482320.1025285.13832755781289307277@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918054436.1971839-1-matthew.brost@intel.com>
In-Reply-To: <20240918054436.1971839-1-matthew.brost@intel.com>
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

--===============7937727070132640844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert to USM lock to rwsem
URL   : https://patchwork.freedesktop.org/series/138794/
State : failure

== Summary ==

CI Bug Log - changes from xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e_full -> xe-pw-138794v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138794v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138794v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138794v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html

  
Known issues
------------

  Here are the changes found in xe-pw-138794v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#1426]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1512])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#616])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1399]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#599]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#309]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#877])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1421])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#651])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#656])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#656]) +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1503] / [Intel XE#599])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#324]) +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2763]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1406])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1127])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#899])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#688]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1392]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#1069])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#584]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@many-reload.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#2723])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@xe_oa@oa-exponents.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][40] ([Intel XE#2723])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#977])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][43] -> [ABORT][44] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@xe_pm@s4-basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][45] -> [ABORT][46] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@xe_pm@s4-basic-exec.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#944]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [PASS][48] -> [ABORT][49] ([Intel XE#2310] / [Intel XE#2317])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][50] ([Intel XE#1701]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][52] ([Intel XE#1426]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][54] ([Intel XE#1426]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][56] -> [PASS][57] +3 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][58] ([Intel XE#1659]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#877]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][68] ([Intel XE#886]) -> [PASS][69] +3 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-lnl:          [DMESG-WARN][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [INCOMPLETE][72] ([Intel XE#2622]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - {shard-bmg}:        [DMESG-WARN][74] ([Intel XE#877]) -> [PASS][75] +2 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-5/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][76] ([Intel XE#324]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][78] ([Intel XE#324]) -> [PASS][79] +6 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][80] ([Intel XE#1430]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][82] ([Intel XE#771] / [Intel XE#899]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][84] ([Intel XE#899]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][86] ([Intel XE#899]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][88] ([Intel XE#899]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         [FAIL][90] ([Intel XE#2666]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][92] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#2105]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@oa-exponents:
    - {shard-bmg}:        [FAIL][96] ([Intel XE#2723]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-7/igt@xe_oa@oa-exponents.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-7/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][98] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][100] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][102] ([Intel XE#1794]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][104] ([Intel XE#958]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [FAIL][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#873]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#873])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][111] ([Intel XE#316]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#316]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][114] ([Intel XE#1204]) -> [DMESG-FAIL][115] ([Intel XE#324])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][116] ([Intel XE#324]) -> [FAIL][117] ([Intel XE#1231])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][118] ([Intel XE#1231]) -> [DMESG-FAIL][119] ([Intel XE#324])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][121] ([Intel XE#1124]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1124]) -> [SKIP][123] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][125] ([Intel XE#619])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#346]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#346])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][129] ([Intel XE#2191]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#367]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][133] ([Intel XE#367]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][135] ([Intel XE#1252]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#787]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][141] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#787]) +41 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1252]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][147] ([Intel XE#306])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#306]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][151] ([Intel XE#373]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#373]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#307]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][157] ([Intel XE#308]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#323]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#323])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][161] ([Intel XE#776])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][163] ([Intel XE#701])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][165] ([Intel XE#455]) +9 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#651]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#651]) +27 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][169] ([Intel XE#651]) +19 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][171] ([Intel XE#653]) +19 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#653]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) +23 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][175] ([Intel XE#605])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2763]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#2763]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#908]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#908])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1129])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][187] ([Intel XE#1489]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1489]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1122]) -> [SKIP][191] ([Intel XE#1122] / [Intel XE#1201])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#929]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][195] ([Intel XE#929]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr@psr2-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][197] ([Intel XE#1149])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][199] ([Intel XE#327])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#327]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#327])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#1500])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][205] ([Intel XE#2168])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_vrr@cmrr.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2168]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#2168])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_vrr@lobf.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#756]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][211] ([Intel XE#756])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][213] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1123]) -> [SKIP][217] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][219] ([Intel XE#1123])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][221] ([Intel XE#288]) +15 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#288]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][225] ([Intel XE#2360])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2229]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#2229])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#378]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#378])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][231] ([Intel XE#2541]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2541]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_oa@non-zero-reason.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_oa@non-zero-reason.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][235] ([Intel XE#977])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#944]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][241] ([Intel XE#944]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2666]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2666
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e -> xe-pw-138794v1

  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e
  xe-pw-138794v1: 138794v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/index.html

--===============7937727070132640844==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert to USM lock to rwsem</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138794/">https://patchwork.freedesktop.org/series/138794/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e_full -&gt; xe-pw-138794v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138794v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138794v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138794v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning@ad-hdmi-a6-dp4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138794v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-5/igt@kms_plane@pixel-format@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2666">Intel XE#2666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-bmg-7/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-bmg-7/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138794v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e -&gt; xe-pw-138794v1</li>
</ul>
<p>IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e<br />
  xe-pw-138794v1: 138794v1</p>

</body>
</html>

--===============7937727070132640844==--
