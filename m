Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB19C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 05:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D81410EA53;
	Fri, 17 Jan 2025 05:42:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024FE10EA53;
 Fri, 17 Jan 2025 05:42:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7882591873922991159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/ptl=3A_Apply_Wa=5F1?=
 =?utf-8?q?3011645652?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 05:42:00 -0000
Message-ID: <173709252099.588872.18204281413515808998@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116184659.384874-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250116184659.384874-1-vinay.belgaumkar@intel.com>
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

--===============7882591873922991159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Apply Wa_13011645652
URL   : https://patchwork.freedesktop.org/series/143631/
State : failure

== Summary ==

CI Bug Log - changes from xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full -> xe-pw-143631v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143631v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143631v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143631v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2.html

  
New tests
---------

  New tests have been introduced between xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full and xe-pw-143631v1_full:

### New IGT tests (51) ###

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.74] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_flip@absolute-wf_vblank@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@absolute-wf_vblank@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@absolute-wf_vblank@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@absolute-wf_vblank@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.95] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_lease@lease-get@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_lease@lease-get@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.95] s

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.63] s

  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.67] s

  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [8.63] s

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  

Known issues
------------

  Here are the changes found in xe-pw-143631v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#1885]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@core_hotunplug@hotreplug.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@fbdev@pan.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@fbdev@pan.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2136]) +16 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +83 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2907]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1152]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#323])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#2141]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1340])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#703])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#3321]) +4 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][40] -> [ABORT][41] ([Intel XE#2625])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2423]) +94 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#651]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#656]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#653]) +16 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2953]) +6 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-2/igt@kms_lease@setcrtc-implicit-plane.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-adlp-9/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6 (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#361]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2763]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2763]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2446])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1489]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#899]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2168])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_vrr@cmrr.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1126])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2905]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#1130]) +212 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#1392]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#288]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2229])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#3546])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1337])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][77] -> [ABORT][78] ([Intel XE#1358] / [Intel XE#1794])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@xe_pm@s2idle-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [PASS][79] -> [ABORT][80] ([Intel XE#1358])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2284] / [Intel XE#366])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][82] -> [ABORT][83] ([Intel XE#1358] / [Intel XE#1607])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@xe_pm@s4-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][84] -> [ABORT][85] ([Intel XE#1358] / [Intel XE#1794])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#944])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][87] ([Intel XE#1885]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][89] ([Intel XE#2134]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@fbdev@unaligned-read.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@fbdev@unaligned-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#3908]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][93] ([Intel XE#2136]) -> [PASS][94] +27 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][95] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [SKIP][97] ([Intel XE#2423]) -> [PASS][98] +84 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
    - shard-dg2-set2:     [ABORT][99] ([Intel XE#4083]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][101] ([Intel XE#2291]) -> [PASS][102] +2 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][103] ([Intel XE#3009]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_dp_aux_dev.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][105] ([Intel XE#3321]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][107] ([Intel XE#301]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][109] ([Intel XE#2316]) -> [PASS][110] +4 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][111] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][113] ([Intel XE#2597]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [FAIL][117] ([Intel XE#886]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][119] ([Intel XE#616]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][121] ([Intel XE#2446]) -> [PASS][122] +4 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@cursor.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#899]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][125] ([Intel XE#1130]) -> [PASS][126] +222 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#2953]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][131] ([Intel XE#1192]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][133] ([Intel XE#1358]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][135] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [ABORT][137] ([Intel XE#2625]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][139] ([Intel XE#873]) -> [SKIP][140] ([Intel XE#2423])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][141] ([Intel XE#2370]) -> [SKIP][142] ([Intel XE#2423])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][143] ([Intel XE#2327]) -> [SKIP][144] ([Intel XE#2136]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][145] ([Intel XE#2136]) -> [SKIP][146] ([Intel XE#2327]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][147] ([Intel XE#2136]) -> [SKIP][148] ([Intel XE#1124]) +10 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][149] ([Intel XE#2136]) -> [SKIP][150] ([Intel XE#607])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][151] ([Intel XE#2136]) -> [SKIP][152] ([Intel XE#2328])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][153] ([Intel XE#607]) -> [SKIP][154] ([Intel XE#2136])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][155] ([Intel XE#1124]) -> [SKIP][156] ([Intel XE#2136]) +14 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][157] ([Intel XE#2423]) -> [SKIP][158] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][159] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][160] ([Intel XE#2423]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][161] ([Intel XE#2423]) -> [SKIP][162] ([Intel XE#367]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][163] ([Intel XE#367]) -> [SKIP][164] ([Intel XE#2423]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][165] ([Intel XE#2887]) -> [SKIP][166] ([Intel XE#2136]) +16 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][167] ([Intel XE#2136]) -> [SKIP][168] ([Intel XE#2887]) +18 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][169] ([Intel XE#2136]) -> [SKIP][170] ([Intel XE#2652] / [Intel XE#787])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][171] ([Intel XE#2136]) -> [SKIP][172] ([Intel XE#3432]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][173] ([Intel XE#3432]) -> [SKIP][174] ([Intel XE#2136]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][175] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][176] ([Intel XE#2136])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][177] ([Intel XE#2724]) -> [SKIP][178] ([Intel XE#2136]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_cdclk@plane-scaling.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][179] ([Intel XE#2423]) -> [SKIP][180] ([Intel XE#2252]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][181] ([Intel XE#2423]) -> [SKIP][182] ([Intel XE#2325]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][183] ([Intel XE#2325]) -> [SKIP][184] ([Intel XE#2423]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][185] ([Intel XE#2252]) -> [SKIP][186] ([Intel XE#2423]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][187] ([Intel XE#2341]) -> [FAIL][188] ([Intel XE#1178])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][189] ([Intel XE#2423]) -> [SKIP][190] ([Intel XE#2341]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][191] ([Intel XE#2423]) -> [SKIP][192] ([Intel XE#2390]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][193] ([Intel XE#1178]) -> [SKIP][194] ([Intel XE#2423]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_content_protection@legacy.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][195] ([Intel XE#2341]) -> [SKIP][196] ([Intel XE#2423])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@lic-type-1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][197] ([Intel XE#1188]) -> [SKIP][198] ([Intel XE#2423])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_content_protection@uevent.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][199] ([Intel XE#2423]) -> [SKIP][200] ([Intel XE#2320]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][201] ([Intel XE#2423]) -> [SKIP][202] ([Intel XE#2321]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][203] ([Intel XE#2320]) -> [SKIP][204] ([Intel XE#2423]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][205] ([Intel XE#2321]) -> [SKIP][206] ([Intel XE#2423]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][207] ([Intel XE#2286]) -> [SKIP][208] ([Intel XE#2423]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][209] ([Intel XE#2423]) -> [SKIP][210] ([Intel XE#2286]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][211] ([Intel XE#2423]) -> [SKIP][212] ([Intel XE#2291]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][213] ([Intel XE#2291]) -> [DMESG-WARN][214] ([Intel XE#877])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][215] ([Intel XE#1508]) -> [SKIP][216] ([Intel XE#2136])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][217] ([Intel XE#2136]) -> [FAIL][218] ([Intel XE#2141])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][219] ([Intel XE#2423]) -> [SKIP][220] ([Intel XE#2323])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][221] ([Intel XE#2244]) -> [SKIP][222] ([Intel XE#2136]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][223] ([Intel XE#2136]) -> [SKIP][224] ([Intel XE#2244]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][225] ([Intel XE#2136]) -> [FAIL][226] ([Intel XE#1695])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][227] ([Intel XE#2423]) -> [SKIP][228] ([Intel XE#2373])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][229] ([Intel XE#2423]) -> [SKIP][230] ([Intel XE#2375])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [SKIP][231] ([Intel XE#2316]) -> [SKIP][232] ([Intel XE#2423])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][233] ([Intel XE#2423]) -> [SKIP][234] ([Intel XE#2316]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][235] ([Intel XE#2882]) -> [SKIP][236] ([Intel XE#2423])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][237] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][238] ([Intel XE#2136]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][241] ([Intel XE#2312]) -> [SKIP][242] ([Intel XE#2311]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][243] ([Intel XE#2311]) -> [SKIP][244] ([Intel XE#2136]) +33 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][245] ([Intel XE#2312]) -> [SKIP][246] ([Intel XE#2136]) +9 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#2311]) -> [SKIP][248] ([Intel XE#2312]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#2312]) +19 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#2311]) +28 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][253] ([Intel XE#2333]) -> [SKIP][254] ([Intel XE#2136]) +13 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][255] ([Intel XE#2333]) -> [SKIP][256] ([Intel XE#2312])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136]) -> [FAIL][258] ([Intel XE#2333]) +14 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][259] ([Intel XE#2312]) -> [FAIL][260] ([Intel XE#2333]) +2 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#2352])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2313]) -> [SKIP][264] ([Intel XE#2312]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#2313]) +28 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][267] ([Intel XE#2313]) -> [SKIP][268] ([Intel XE#2136]) +30 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][269] ([Intel XE#2350]) -> [SKIP][270] ([Intel XE#2136])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2313]) +6 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][273] ([Intel XE#2423]) -> [SKIP][274] ([Intel XE#2502])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][275] ([Intel XE#2423]) -> [SKIP][276] ([Intel XE#2340])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][277] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][278] ([Intel XE#2423])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][279] ([Intel XE#2423]) -> [SKIP][280] ([Intel XE#1503])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#346])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][283] ([Intel XE#2934]) -> [SKIP][284] ([Intel XE#2136])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#3012])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][287] ([Intel XE#2136]) -> [SKIP][288] ([Intel XE#2934])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2927])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][291] ([Intel XE#2423]) -> [SKIP][292] ([Intel XE#2501])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][293] ([Intel XE#2486]) -> [SKIP][294] ([Intel XE#2423])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_panel_fitting@legacy.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][295] ([Intel XE#2423]) -> [SKIP][296] ([Intel XE#2393])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][297] ([Intel XE#2493]) -> [SKIP][298] ([Intel XE#2423]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][299] ([Intel XE#2423]) -> [SKIP][300] ([Intel XE#2763]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][301] ([Intel XE#2763]) -> [SKIP][302] ([Intel XE#2423]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#870]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][305] ([Intel XE#2392]) -> [SKIP][306] ([Intel XE#2136])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][307] ([Intel XE#2136]) -> [FAIL][308] ([Intel XE#1430])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][309] ([Intel XE#2505]) -> [SKIP][310] ([Intel XE#2136])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][311] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][312] ([Intel XE#2446]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][313] ([Intel XE#1489]) -> [SKIP][314] ([Intel XE#2136]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#1489]) +10 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onoff.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][319] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][320] ([Intel XE#2136]) +17 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][321] ([Intel XE#2234]) -> [SKIP][322] ([Intel XE#2136])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#3414] / [Intel XE#3904])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][325] ([Intel XE#2423]) -> [SKIP][326] ([Intel XE#2330]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][327] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][328] ([Intel XE#2423]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][329] ([Intel XE#2413]) -> [SKIP][330] ([Intel XE#2423])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#2413])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][333] ([Intel XE#1435]) -> [SKIP][334] ([Intel XE#2423])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][335] ([Intel XE#2423]) -> [SKIP][336] ([Intel XE#2426])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][337] ([Intel XE#1499]) -> [SKIP][338] ([Intel XE#2423]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_vrr@flip-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][339] ([Intel XE#2423]) -> [SKIP][340] ([Intel XE#1499])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][341] ([Intel XE#756]) -> [SKIP][342] ([Intel XE#2423])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_writeback@writeback-fb-id.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#756]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][345] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][346] ([Intel XE#2423])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][347] ([Intel XE#2905]) -> [SKIP][348] ([Intel XE#1130]) +14 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_eudebug@basic-read-event.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][349] ([Intel XE#1130]) -> [SKIP][350] ([Intel XE#2905]) +11 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_eudebug@discovery-empty.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#2322]) +8 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][353] ([Intel XE#2322]) -> [SKIP][354] ([Intel XE#1130]) +11 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][355] ([Intel XE#1130]) -> [SKIP][356] ([Intel XE#586])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_mmap@small-bar.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][357] ([Intel XE#2248]) -> [SKIP][358] ([Intel XE#1130])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][359] ([Intel XE#2245]) -> [SKIP][360] ([Intel XE#1130])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][361] ([Intel XE#1130]) -> [SKIP][362] ([Intel XE#2284]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][363] ([Intel XE#2284]) -> [SKIP][364] ([Intel XE#1130])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][365] ([Intel XE#1130]) -> [SKIP][366] ([Intel XE#944]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][367] ([Intel XE#944]) -> [SKIP][368] ([Intel XE#1130]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][369] ([Intel XE#1130]) -> [SKIP][370] ([Intel XE#3342])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4083]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde -> xe-pw-143631v1

  IGT_8195: 8195
  xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde: 94cf137e747640246cf996a17ca3cebdbd7cbdde
  xe-pw-143631v1: 143631v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/index.html

--===============7882591873922991159==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Apply Wa_13011645652</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143631/">https://patchwork.freedesktop.org/series/143631/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full -&gt; xe-pw-143631v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143631v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143631v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143631v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a2-dp2.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde_full and xe-pw-143631v1_full:</p>
<h3>New IGT tests (51)</h3>
<ul>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-get@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143631v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-2/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-adlp-9/igt@kms_lease@setcrtc-implicit-plane.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6 (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +212 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-435/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@fbdev@unaligned-read.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +84 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083">Intel XE#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_pm_rpm@cursor.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +222 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-433/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-dg2-434/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143631v1/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde -&gt; xe-pw-143631v1</li>
</ul>
<p>IGT_8195: 8195<br />
  xe-2499-94cf137e747640246cf996a17ca3cebdbd7cbdde: 94cf137e747640246cf996a17ca3cebdbd7cbdde<br />
  xe-pw-143631v1: 143631v1</p>

</body>
</html>

--===============7882591873922991159==--
