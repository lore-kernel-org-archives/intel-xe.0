Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8275CEDDA4
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 15:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8729110E775;
	Wed,  9 Oct 2024 15:18:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7452910E774;
 Wed,  9 Oct 2024 15:18:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7663585872197589750=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/dmc=3A_Add_dmc_null_ch?=
 =?utf-8?q?eck?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 15:18:27 -0000
Message-ID: <172848710746.1210750.2423536817794006675@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009065434.1799459-2-suraj.kandpal@intel.com>
In-Reply-To: <20241009065434.1799459-2-suraj.kandpal@intel.com>
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

--===============7663585872197589750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Add dmc null check
URL   : https://patchwork.freedesktop.org/series/139752/
State : failure

== Summary ==

CI Bug Log - changes from xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff_full -> xe-pw-139752v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139752v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139752v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139752v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_pm_rpm@legacy-planes@plane-59:
    - shard-lnl:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html

  * igt@xe_exec_basic@many-bindexecqueue:
    - shard-adlp:         [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@xe_exec_basic@many-bindexecqueue.html

  * igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0:
    - shard-lnl:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-lnl:          [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@xe_oa@non-privileged-access-vaddr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@xe_oa@non-privileged-access-vaddr.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][13] ([Intel XE#1231]) -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][15] ([Intel XE#651]) -> [TIMEOUT][16] +1 other test timeout
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in xe-pw-139752v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1466])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#1701]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#877])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-adlp:         [PASS][25] -> [TIMEOUT][26] ([Intel XE#402])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1407])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1477])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1033] / [Intel XE#1727])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#1727])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#599])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2321])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#1475])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1138])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +6 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1195] / [Intel XE#2049])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#352])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#656])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656]) +14 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#324]) +6 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [PASS][63] -> [DMESG-FAIL][64] ([Intel XE#324])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#616]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2763]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#1430])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#2864] / [Intel XE#2990])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1437])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1127])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1435])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#756])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2905]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#2905])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][78] -> [TIMEOUT][79] ([Intel XE#1473] / [Intel XE#402])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][80] -> [TIMEOUT][81] ([Intel XE#1473])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#688]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#288])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#288])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_sip@sanity-after-timeout:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#2977])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][88] -> [DMESG-WARN][89] ([Intel XE#1638] / [Intel XE#358])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2541])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_oa@non-zero-reason.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [ABORT][91] ([Intel XE#1358])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#2699])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-6/igt@xe_pm@s2idle-mocs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-6/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][94] ([Intel XE#1694])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][95] -> [ABORT][96] ([Intel XE#1358])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#584])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][98] -> [ABORT][99] ([Intel XE#1358] / [Intel XE#1607])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][100] -> [ABORT][101] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#944])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#944]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][104] ([Intel XE#1426]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#877]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - {shard-bmg}:        [FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][110] ([Intel XE#1475]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
    - shard-adlp:         [FAIL][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][114] ([Intel XE#301]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][116] ([Intel XE#886]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][118] ([Intel XE#301]) -> [PASS][119] +6 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
    - shard-lnl:          [FAIL][122] -> [PASS][123] +5 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][124] ([Intel XE#1033] / [Intel XE#1195]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-adlp:         [TIMEOUT][126] -> [PASS][127] +3 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_plane@planar-pixel-format-settings.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][128] ([Intel XE#324]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][130] ([Intel XE#324]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#2763]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [INCOMPLETE][134] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-50:
    - shard-lnl:          [DMESG-FAIL][136] ([Intel XE#1620] / [Intel XE#2990]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-50.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-50.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][138] ([Intel XE#2948]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][140] ([Intel XE#899]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][142] ([Intel XE#2159]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][144] ([Intel XE#1473]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#1000]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr:
    - shard-lnl:          [INCOMPLETE][148] -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][150] ([Intel XE#2754]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [INCOMPLETE][152] ([Intel XE#2105]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-lnl:          [ABORT][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [ABORT][156] -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-432/igt@xe_pm@s3-mocs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - {shard-bmg}:        [DMESG-WARN][158] -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][160] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][162] ([Intel XE#958]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][164] ([Intel XE#1204]) -> [DMESG-FAIL][165] ([Intel XE#324])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][166] ([Intel XE#324]) -> [FAIL][167] ([Intel XE#1231]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [TIMEOUT][168] -> [SKIP][169] ([Intel XE#651])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][170] -> [FAIL][171] ([Intel XE#1861])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         [TIMEOUT][172] -> [SKIP][173] ([Intel XE#656])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#362]) -> [FAIL][175] ([Intel XE#1729])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1500]) -> [SKIP][177] ([Intel XE#362])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2699
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977
  [Intel XE#2990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff -> xe-pw-139752v1

  IGT_8061: 8061
  xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff: 97b4690ecb1eafab876fe8be401d0d45bb5eb5ff
  xe-pw-139752v1: 139752v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/index.html

--===============7663585872197589750==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Add dmc null check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139752/">https://patchwork.freedesktop.org/series/139752/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff_full -&gt; xe-pw-139752v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139752v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139752v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139752v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-59.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@xe_exec_basic@many-bindexecqueue.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@xe_oa@non-privileged-access-vaddr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139752v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990">Intel XE#2990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@sanity-after-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@xe_exec_sip@sanity-after-timeout.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977">Intel XE#2977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-6/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-6/igt@xe_pm@s2idle-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2699">Intel XE#2699</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_plane@planar-pixel-format-settings.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_plane@planar-pixel-format-settings.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-50.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990">Intel XE#2990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139752v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff -&gt; xe-pw-139752v1</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2030-97b4690ecb1eafab876fe8be401d0d45bb5eb5ff: 97b4690ecb1eafab876fe8be401d0d45bb5eb5ff<br />
  xe-pw-139752v1: 139752v1</p>

</body>
</html>

--===============7663585872197589750==--
