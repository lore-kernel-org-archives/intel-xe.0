Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37B9CCD1A3
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 12:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61910E081;
	Wed, 18 Sep 2024 12:46:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C7210E188;
 Wed, 18 Sep 2024 12:46:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0162621095174585504=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915_=26_drm/xe=3A_kill_off?=
 =?utf-8?q?_-Ddrm=5Fi915=5Fgem=5Fobject=3Dxe=5Fbo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 12:46:10 -0000
Message-ID: <172666357090.1026131.5117627656707238247@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726589119.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726589119.git.jani.nikula@intel.com>
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

--===============0162621095174585504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915 & drm/xe: kill off -Ddrm_i915_gem_object=xe_bo (rev2)
URL   : https://patchwork.freedesktop.org/series/138773/
State : failure

== Summary ==

CI Bug Log - changes from xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e_full -> xe-pw-138773v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138773v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138773v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138773v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  
#### Warnings ####

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#1130] / [Intel XE#1201]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in xe-pw-138773v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#324]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#1426]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1426]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1512])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [FAIL][15] ([Intel XE#616])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1399]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#373]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#599]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#309]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#877]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1421])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#651])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#656])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#656]) +11 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1503] / [Intel XE#599])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-3:
    - shard-lnl:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#324])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1874])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#361])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2763]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1406])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1127])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#899]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#688]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1392]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#584]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#2723])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@xe_oa@oa-exponents.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][45] ([Intel XE#2723])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#977])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][48] -> [ABORT][49] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@xe_pm@s4-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][50] -> [ABORT][51] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#944]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2747])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][55] -> [ABORT][56] ([Intel XE#2310] / [Intel XE#2317])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][57] ([Intel XE#1701]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][59] ([Intel XE#1426]) -> [PASS][60] +1 other test pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][61] ([Intel XE#1426]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][63] -> [PASS][64] +3 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][65] ([Intel XE#877]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][73] ([Intel XE#886]) -> [PASS][74] +3 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-lnl:          [DMESG-WARN][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [INCOMPLETE][77] ([Intel XE#2622]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][79] ([Intel XE#324]) -> [PASS][80] +6 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][81] ([Intel XE#324]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][83] ([Intel XE#1874]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][85] ([Intel XE#1430]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][87] ([Intel XE#771] / [Intel XE#899]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][89] ([Intel XE#899]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][91] ([Intel XE#899]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         [FAIL][93] ([Intel XE#2666]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-2/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][95] ([Intel XE#1473]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#2105]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][99] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][101] ([Intel XE#1794]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][103] ([Intel XE#958]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][106] ([Intel XE#316])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#316]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#316])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][109] ([Intel XE#1231]) -> [DMESG-FAIL][110] ([Intel XE#324])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][111] ([Intel XE#324]) -> [FAIL][112] ([Intel XE#1231])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][114] ([Intel XE#619])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][116] ([Intel XE#1124]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1124]) -> [SKIP][118] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#346]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#346])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#367]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][124] ([Intel XE#367]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#787]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][128] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][132] ([Intel XE#787]) +34 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][134] ([Intel XE#314]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#306]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#373]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][140] ([Intel XE#373]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#307]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][144] ([Intel XE#308])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#323]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#323])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [i915#3804]) -> [SKIP][148] ([i915#3804])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][150] ([Intel XE#455]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][152] ([Intel XE#1135])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][154] ([Intel XE#651]) +14 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#651]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][158] ([Intel XE#653]) +14 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#653]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#455]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][163] ([Intel XE#324]) -> [DMESG-WARN][164] ([Intel XE#324])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][168] ([Intel XE#2763]) +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][170] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2763]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#2763]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#908]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#908])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][175] ([Intel XE#1204]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#734])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][178] ([Intel XE#1489]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1489]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1122]) -> [SKIP][182] ([Intel XE#1122] / [Intel XE#1201])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][184] ([Intel XE#929]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#929]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][188] ([Intel XE#1127])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][190] ([Intel XE#327])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#327]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#327])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][193] ([Intel XE#1729]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#362])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#1500])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2168]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#2168])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_vrr@lobf.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#756]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#756])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1123]) -> [SKIP][202] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1126]) -> [SKIP][204] ([Intel XE#1126] / [Intel XE#1201])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][206] ([Intel XE#288]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#288]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][210] ([Intel XE#2360])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][212] ([Intel XE#512])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_mmap@small-bar.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][214] ([Intel XE#378])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_module_load@force-load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#378]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#378])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2541]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_oa@non-zero-reason.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][220] ([Intel XE#2541]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_oa@oa-formats.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_oa@oa-formats.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][224] ([Intel XE#2284])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#944]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][228] ([Intel XE#944])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
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
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2666]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2666
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2747
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e -> xe-pw-138773v2

  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e
  xe-pw-138773v2: 138773v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/index.html

--===============0162621095174585504==
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
<tr><td><b>Series:</b></td><td>drm/i915 &amp; drm/xe: kill off -Ddrm_i915_gem_object=xe_bo (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138773/">https://patchwork.freedesktop.org/series/138773/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e_full -&gt; xe-pw-138773v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138773v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138773v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138773v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_wedged@wedged-at-any-timeout:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138773v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-3/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2747">Intel XE#2747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2666">Intel XE#2666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-2/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138773v2/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e -&gt; xe-pw-138773v2</li>
</ul>
<p>IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1964-9e7beda0345afd64530e5edef7d45909d8d90a5e: 9e7beda0345afd64530e5edef7d45909d8d90a5e<br />
  xe-pw-138773v2: 138773v2</p>

</body>
</html>

--===============0162621095174585504==--
