Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E2BC02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 12:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD8E10E6AC;
	Tue, 18 Feb 2025 12:58:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDBF10E6AB;
 Tue, 18 Feb 2025 12:58:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3798040249661659309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/=7Bi915=2C_xe=7D/displ?=
 =?utf-8?q?ay=3A_Move_dsm_registration_under_intel=5Fdriver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 12:58:17 -0000
Message-ID: <173988349777.3568274.981459898484010012@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217200133.741758-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250217200133.741758-1-rodrigo.vivi@intel.com>
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

--===============3798040249661659309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: Move dsm registration under intel_driver
URL   : https://patchwork.freedesktop.org/series/144974/
State : failure

== Summary ==

CI Bug Log - changes from xe-2677-c282b8face163244076dac30e4c9ffd74dc89044_full -> xe-pw-144974v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144974v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144974v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144974v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-6/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  
#### Warnings ####

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-dg2-set2:     [DMESG-WARN][5] ([Intel XE#1033]) -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#4172]) -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     [DMESG-WARN][9] ([Intel XE#1033]) -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][11] ([Intel XE#4268]) -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-144974v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][13] -> [FAIL][14] ([Intel XE#3908]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#3862]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +50 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#373]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color@ctm-negative@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][25] ([Intel XE#1033]) +2 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_color@ctm-negative@pipe-d-dp-4.html

  * igt@kms_color@ctm-signed:
    - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#877]) +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_color@ctm-signed.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][28] ([Intel XE#1033])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][31] -> [INCOMPLETE][32] ([Intel XE#3226])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#4294])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2955])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#310]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#3321]) +4 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#301]) +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#886]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#301]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [PASS][48] -> [FAIL][49] ([Intel XE#3321]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#886]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#1033]) +1 other test dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1033]) +17 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#656]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][61] ([Intel XE#4172]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#309]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1489]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1122])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2939])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1127])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#899])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2953]) +2 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2905]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4172]) +11 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#288]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#4173]) +1 other test dmesg-warn
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2541] / [Intel XE#3573])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_oa@map-oa-buffer.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][80] ([Intel XE#4268])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#3088] / [Intel XE#4172])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][83] ([Intel XE#3908]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][85] ([Intel XE#1033]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][87] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][89] ([Intel XE#2291]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#309]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#3009]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_dp_aux_dev.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][95] ([Intel XE#2316]) -> [PASS][96] +8 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#310]) -> [PASS][98] +2 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][99] ([Intel XE#2882]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][101] ([Intel XE#886]) -> [PASS][102] +5 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][103] ([Intel XE#301]) -> [PASS][104] +2 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][105] ([Intel XE#3321]) -> [PASS][106] +2 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][107] ([Intel XE#301]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-lnl:          [FAIL][109] ([Intel XE#3098]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [INCOMPLETE][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#656]) -> [PASS][114] +3 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][115] ([Intel XE#1503]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#4328]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][119] ([Intel XE#4172]) -> [PASS][120] +8 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_lowres@tiling-none@pipe-d-dp-2.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-dp-2.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][121] ([Intel XE#2571]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [DMESG-WARN][123] -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_properties@crtc-properties-atomic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][125] ([Intel XE#2883]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_setmode@basic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#2953]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [FAIL][129] ([Intel XE#4278]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1033] / [Intel XE#1473]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_evict@evict-beng-small-multi-vm.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1033]) -> [PASS][134] +5 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#4173]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][137] -> [DMESG-WARN][138] ([Intel XE#1033])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][140] ([Intel XE#787]) +9 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#787]) -> [SKIP][142] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#1178]) -> [SKIP][144] ([Intel XE#455])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#455]) -> [DMESG-FAIL][146] ([Intel XE#1033])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_content_protection@srm.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#4172]) -> [SKIP][148] ([Intel XE#2291])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#2955]) -> [SKIP][150] ([Intel XE#2316])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][151] ([Intel XE#2316]) -> [FAIL][152] ([Intel XE#3321]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#301]) -> [SKIP][154] ([Intel XE#310])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][155] ([Intel XE#2316]) -> [DMESG-WARN][156] ([Intel XE#4172])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#310]) -> [DMESG-WARN][158] ([Intel XE#1033])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][159] ([Intel XE#2311]) -> [SKIP][160] ([Intel XE#2312]) +10 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#651]) -> [SKIP][162] ([Intel XE#656]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#4141]) -> [SKIP][164] ([Intel XE#2312]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][165] ([Intel XE#2312]) -> [SKIP][166] ([Intel XE#4141]) +13 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#656]) -> [DMESG-WARN][168] ([Intel XE#1033])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][169] ([Intel XE#2312]) -> [SKIP][170] ([Intel XE#2311]) +24 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#656]) -> [SKIP][172] ([Intel XE#651]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2313]) +27 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#656]) -> [SKIP][176] ([Intel XE#653]) +9 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#2313]) -> [SKIP][178] ([Intel XE#2312]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#653]) -> [SKIP][180] ([Intel XE#656]) +14 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][181] ([Intel XE#1729]) -> [SKIP][182] ([Intel XE#362])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][183] ([Intel XE#2426]) -> [SKIP][184] ([Intel XE#2509])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-2677-c282b8face163244076dac30e4c9ffd74dc89044 -> xe-pw-144974v1

  IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044
  xe-pw-144974v1: 144974v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/index.html

--===============3798040249661659309==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: Move dsm registration under intel_driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144974/">https://patchwork.freedesktop.org/series/144974/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2677-c282b8face163244076dac30e4c9ffd74dc89044_full -&gt; xe-pw-144974v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144974v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144974v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144974v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_atomic_interruptible@universal-setplane-cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-6/igt@kms_atomic_interruptible@universal-setplane-cursor.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_cursor_edge_walk@64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_cursor_edge_walk@64x64-left-edge.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144974v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_color@ctm-negative@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_color@ctm-signed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_lowres@tiling-none@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_plane_lowres@tiling-none@pipe-d-dp-2.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_properties@crtc-properties-atomic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_setmode@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_content_protection@srm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144974v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2677-c282b8face163244076dac30e4c9ffd74dc89044 -&gt; xe-pw-144974v1</li>
</ul>
<p>IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044<br />
  xe-pw-144974v1: 144974v1</p>

</body>
</html>

--===============3798040249661659309==--
